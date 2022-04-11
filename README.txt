CS202-Programming Paradigms & Pragmatics
Lab 4: Hangman in Perl 

Name: Aditi Das 
Entry Number: 2020CSB1064

Aim: To write a program to play a word-guessing game like Hangman.

Type the following line in terminal to run Hangman.pl:-
 
    perl Hangman.pl

Overall description:-

At the start of the game, the player is given the option to play by entering 'y'(in lowercase) or to enter any other value
to quit game. The player is given this option after every game. If the player types 'y', he/she is given a random word from 
the list and he has to guess the word in not more than 7 incorrect guesses. The game ends when the hangman is struck off
completely, which happens after 7 incorrect guesses. The player can guess words if he thinks he has the correct word in mind,
else he can guess alphabets which the word might contain. If the word guessed is incorrect then the word gets added to the 
list of guesses made, alongwith the alphabet guesses made by player. I have used various subroutines to classify the different 
functions performed. If the player enters an alphabet/word which has already been guessed then it shows a message that it is 
already guessed and the player gets the chance to guess again without any loss of guesses left. The lines of the hangman are 
updated after each guess. Multiple plays are allowed, i.e. you can play a new game after a game is over, or enter any other 
value except 'y' to quit the game. The 'y' should be in lower case. A list containing 100 words have been used from which the 
random word is chosen before each game.

The following list is used as the list containing the words which are randomly chosen at the start of a new game:-

list = ("computer" , "radio" , "calculator" , "teacher" , "bureau" , "police" , "geometry" , "president",    
        "subject" , "country" , "enviroment" , "classroom" , "animals" ,"province" ,"month" ,"politics" ,    
        "puzzle" , "instrument" , "kitchen" , "language" , "vampire" , "ghost" , "solution" , "service" ,    
        "software" , "virus" , "security" , "phonenumber" ,"expert" ,"website" ,"agreement" , "support" ,    
        "compatibility" ,"advanced" ,"search" ,"triathlon" ,"immediately" ,"encyclopedia" , "endurance" ,    
        "distance" , "nature" ,"history" ,"organization" ,"international" ,"championship" ,"government" ,    
        "popularity" ,"thousand" ,"feature" ,"wetsuit" ,"fitness" , "legendary" , "variation" , "equal" ,    
        "approximately","segment","priority","physics","branche" ,"science" ,"mathematics" ,"lightning" ,    
        "dispersion" ,"accelerator","detector","terminology","design","operation","foundation","application",
        "prediction","reference","measurement","concept","perspective","overview","position","airplane",     
        "symmetry","dimension","toxic","algebra","illustration","classic","verification","citation",         
        "unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis",   
        "director","trademark","vehicle","aircraft","experiment")


Following are the subroutines used and their purposes:-

1.) lines_reset     : To reset the graphic hangman before the start of a new game.
2.) update_lines    : Updates the hangman as per chances left.
3.) print_hangman   : To print the current hangman state.
4.) already_guessed : Returns 1 if the word/alphabet is already guessed else returns 0.
5.) check_alphabet  : To check if the alphabet entered by player is present in the actual word, if yes then it 
                      updates the required attributes.

----------------------------------------------------------------------------------------------------------------------------------