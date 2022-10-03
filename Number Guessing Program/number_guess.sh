#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

DECIMAL_DETECTOR(){
  #Check if the input is a decimal number.
  while [[ $GUESS =~ ^[-+]?([0-9]*\.[0-9]+|[0-9]+\.[0-9]*)$ ]] || [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    NUMBER_OF_GUESSES=$((i++))
    read GUESS
  done
}

GUESS_GAME(){
  read GUESS
  
  DECIMAL_DETECTOR
  NUMBER_OF_GUESSES=0
  while [[ $GUESS != $NUMBER ]]
  do
    if [[ $GUESS > $NUMBER ]]; then
      echo "It's lower than that, guess again:"
      NUMBER_OF_GUESSES=$((i++))
      read GUESS
      DECIMAL_DETECTOR
    elif [[ $GUESS < $NUMBER ]]; then
      echo "It's higher than that, guess again:"
      NUMBER_OF_GUESSES=$((i++))
      read GUESS
      DECIMAL_DETECTOR
    fi
  done

  INSERT_NUMBER_OF_GUESSES_OF_THIS_GAME=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($NUMBER_OF_GUESSES, $USER_ID)")
  
  if [[ $NEW_USER_LABEL = "1" ]]
  then
    BEST_GAME=$($PSQL "SELECT game_id FROM games WHERE user_id=$USER_ID")
  fi
  
  INSERT_NUMBER_OF_GUESSES=$($PSQL "UPDATE usernames SET best_game=$BEST_GAME, games_played=$GAMES_PLAYED+1 WHERE user_id=$USER_ID")
  
  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
}

MAIN_MENU() {
#Prompt that let's the user to enter their username
echo "Enter your username:"
read USERNAME
NUMBER=$(( $RANDOM % 1000 + 1 ))

USERNAME_IN_DATABASE=$($PSQL "SELECT username FROM usernames WHERE username='$USERNAME'")

if [[ -z $USERNAME_IN_DATABASE ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  INSERT_USERNAME=$($PSQL "INSERT INTO usernames(username, best_game, games_played) VALUES('$USERNAME', 1, 0)")
  NEW_USER_LABEL="1"
  USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id='$USER_ID'")

  echo -e "\nGuess the secret number between 1 and 1000:"
  GUESS_GAME
else
  USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT game_id FROM games WHERE number_of_guesses=(SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID)")
  NUMBER_OF_GUESSES_AT_THE_BEST_GAME=$($PSQL "SELECT number_of_guesses FROM games WHERE game_id=$BEST_GAME")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $NUMBER_OF_GUESSES_AT_THE_BEST_GAME guesses."
  echo -e "\nGuess the secret number between 1 and 1000:"
  GUESS_GAME
fi
}

MAIN_MENU
