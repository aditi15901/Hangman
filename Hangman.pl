#!/usr/bin/perl
use Switch;
use warnings;
use strict;

# the list containing 100 words for the hangman game
my @list=("computer" , "radio" , "calculator" , "teacher" , "bureau" , "police" , "geometry" , "president",
          "subject" , "country" , "enviroment" , "classroom" , "animals" ,"province" ,"month" ,"politics" ,
          "puzzle" , "instrument" , "kitchen" , "language" , "vampire" , "ghost" , "solution" , "service" ,
          "software" , "virus" , "security" , "phonenumber" ,"expert" ,"website" ,"agreement" , "support" ,
          "compatibility" ,"advanced" ,"search" ,"triathlon" ,"immediately" ,"encyclopedia" , "endurance" ,
          "distance" , "nature" ,"history" ,"organization" ,"international" ,"championship" ,"government" ,
          "popularity" ,"thousand" ,"feature" ,"wetsuit" ,"fitness" , "legendary" , "variation" , "equal" ,
          "approximately","segment","priority","physics","branche" ,"science" ,"mathematics" ,"lightning" ,
          "dispersion","accelerator","detector","terminology","design","operation","foundation","application",
          "prediction","reference","measurement","concept","perspective","overview","position","airplane",
          "symmetry","dimension", "toxic","algebra","illustration","classic","verification","citation",
          "unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis",
          "director","trademark","vehicle","aircraft","experiment");

# to reset the graphic hangman before the start of a new game
sub lines_reset
{
    my $ln1="\n    ____________\n";
    my $ln2="  ||\t        |\n";
    my $ln3="  ||\t       \n";
    my $ln4="  ||\t              Guesses made:";
    my $ln5="  ||\t              Chances left:";
    my $ln6="  ||\t      \n";
    my $ln7="  ||\t         \n";
    my $ln8="__||__  \n\n";

    return ($ln1, $ln2, $ln3, $ln4, $ln5, $ln6, $ln7, $ln8);
}

# updating the hangman as per chances left
sub update_lines
{
    my $chancesleft= $_[0];
    my $ln3= $_[1];
    my $ln4= $_[2];
    my $ln5= $_[3];
    my $ln6= $_[4];
    $ln6="  ||\t       / \\\n"                if ($chancesleft==0);
    $ln6="  ||\t       /  \n"                 if ($chancesleft==1);
    $ln5="  ||\t        |     Chances left:"  if ($chancesleft==2);
    $ln4="  ||\t       \\|/    Guesses made:" if ($chancesleft==3);
    $ln4="  ||\t       \\|     Guesses made:" if ($chancesleft==4);
    $ln4="  ||\t        |     Guesses made:"  if ($chancesleft==5);
    $ln3="  ||\t        O\n"                  if ($chancesleft==6);
    
    return ($ln3, $ln4, $ln5, $ln6);
}

# to print the current hangman state
sub print_hangman
{
    my $ln1= $_[0];
    my $ln2= $_[1];
    my $ln3= $_[2];
    my $ln4= $_[3];
    my $ln5= $_[4];
    my $ln6= $_[5];
    my $ln7= $_[6];
    my $ln8= $_[7];
    my $chances_remaining= $_[8];
    my @guesses_made= @{$_[9]};

    print "$ln1 $ln2 $ln3 $ln4 @guesses_made \n $ln5 $chances_remaining \n $ln6 $ln7 $ln8";
}

# returns 1 if the word/alphabet is already guessed else 0
sub already_guessed
{
    my $guesslist_len= $_[0];
    my $alphabet_user = $_[1];
    my @guesses_made= @{$_[2]};
    for(my $i=0;$i<$guesslist_len;$i++)
    {
        my $str= substr($guesses_made[$i],0,-1); # $str stores the guesses made by the player at index i
        chomp($str);
        my $x= $alphabet_user eq $str;
        if($x==1)
        {
            print("Already guessed \'$str\'!\n");
            return 1;
        }
    }
    return 0;
}

# to check if the alphabet entered by player is present in the actual word, if yes then it updates the required attributes
sub check_alphabet
{
    my $word_given = $_[0];
    my $alphabet_user = $_[1];
    my $len = $_[2];
    my @wordgiven_user= @{$_[3]};
    my $won_game=0;
    my $f=0;
    for(my $i=0;$i<length($word_given);$i++)
    {
        my $a=substr($word_given,$i,1);
        chomp($a);
        my $c = $a eq $alphabet_user;
        if($c==1)
        {
            $len--;
            $wordgiven_user[$i]=$alphabet_user;
            chomp($wordgiven_user[$i]);
            $f=1;
            $won_game = 1 if($len==0);
        }
    }
    return ($f, $won_game, $len, @wordgiven_user);
}

print("\nWelcome to Hangman!\n\n");
my $play_game="";
print("Enter y to start game: ");
$play_game=<STDIN>;
chomp($play_game);
my $w= $play_game eq 'y'; # if w is 1 then it means to start a new game else terminate program

while($w==1)
{
    switch ($play_game)
    {
        case 'y'
        {
            srand();
            my $chances_left=7;                 # stores the number of chances left for the player after every guess
            my $flag=0;                         # flag variable to denote that the word/alphabet entered by user has been guessed already
            my @guesses=();                     # stores all the alphabets/words guessed by player
            my $listSize = @list;               # stores the size of the list containing the words for the game mentioned above
            my $number= int(rand($listSize+1)); # stores integer value in range 1 to 100
            my $word= $list[($number-1)];       # chooses word at the specified index of list as the word for the current game
            my $length=length($word);           # stores length of the word to be guessed in the current game
            my $win=0;                          # denotes if the game is won or not, 1 denotes win
            my @word_user=();                   # stores the correct guesses of the word by player

            for(my $i=0;$i<$length;$i++)
            {
                push @word_user, '_';
            }
            # the hangman graphic is initialised/reset
            (my $line1,my $line2,my $line3,my $line4,my $line5,my $line6,my $line7,my $line8) = &lines_reset();
            print("\nHere is your word:\n");
            print("\n@word_user\n");
            print "$line1 $line2 $line3 $line4 - \n $line5 $chances_left \n $line6 $line7 $line8";

            while($chances_left!=0)
            {
                $flag=0;
                print("\nMake a guess: ");
                my $alphabet=<STDIN>;
                chomp($alphabet);
                my $guesslistSize = @guesses;
                if(length($alphabet)>1) # for words guessed by player
                {
                    my $x= $alphabet eq $word;
                    $win=1 if ($x==1);
                }
                if($win==0) # if the player didnot guess the whole word at once
                {
                    
                    $flag=already_guessed($guesslistSize, $alphabet, \@guesses) if ($flag==0);
                    if($flag==0)
                    {
                        push @guesses,$alphabet." "; #the alphabet/word guessed is pushed into the guesses list
                        ($flag, $win, $length, @word_user) = check_alphabet($word, $alphabet, $length, \@word_user);
                        print("\n@word_user\n");
                        $chances_left-- if($flag==0);

                        # updating the hangman lines as per chances left
                        ($line3, $line4, $line5, $line6)= update_lines($chances_left, $line3, $line4, $line5, $line6);
                        
                        #printing the current hangman state
                        print_hangman($line1, $line2, $line3, $line4, $line5, $line6, $line7, $line8, $chances_left, \@guesses);
                    }
                    print("You lost the game! The word was \'$word\'!\n\n") if($chances_left==0);
                }
                if($win==1)
                {
                    print("You got it right! The word was \'$word\'!\n\n");
                    last;
                }
            }
        }
    }
    print("Enter y to play again or any other value to quit: ");
    $play_game=<STDIN>;
    chomp($play_game);
    $w= $play_game eq 'y';
}
