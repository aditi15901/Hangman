# Hangman
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
