#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
NUMBER_OF_GUESSES=0

echo Enter your username:
read USERNAME

SECRET_NUMBER=$(( 1 + RANDOM % 1000 ))
echo $SECRET_NUMBER

USER=$($PSQL "select * from users where username = '$USERNAME'")
TOTAL_GAMES=$($PSQL "select games_played from users where username = '$USERNAME'")
BEST_ONE=$($PSQL "select best_game from users where username = '$USERNAME'")

if [[ -z $USER ]]
then
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT_USER=$($PSQL "insert into users(username, games_played, best_game) values('$USERNAME', 0, 0)")
else
  echo "$USER" | while read USER_ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

GUESS_NUMBER(){
  if [[ $1 ]]
  then
    echo $1
  fi
  read P_NUMBER
  if [[ ! $P_NUMBER =~ ^[0-9]+$ ]]
  then
    GUESS_NUMBER "That is not an integer, guess again:"
  else
    if [[ $P_NUMBER -lt $SECRET_NUMBER ]]
    then
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      GUESS_NUMBER "It's higher than that, guess again:"
    elif [[ $P_NUMBER -gt $SECRET_NUMBER ]]
    then
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      GUESS_NUMBER "It's lower than that, guess again:"
    elif [[ $P_NUMBER -eq $SECRET_NUMBER ]]
    then
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      TOTAL_GAMES=$(( TOTAL_GAMES + 1 ))
      UPDATE_GAMES=$($PSQL "update users set games_played = $TOTAL_GAMES where username = '$USERNAME'")

      if [[ $BEST_ONE -eq 0 || -z $BEST_ONE ]]
      then
        UPDATE_GAMES=$($PSQL "update users set best_game = $NUMBER_OF_GUESSES where username = '$USERNAME'")
      elif [[ $NUMBER_OF_GUESSES -lt $BEST_ONE ]]
      then
        UPDATE_GAMES=$($PSQL "update users set best_game = $NUMBER_OF_GUESSES where username = '$USERNAME'")
      fi
      #echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    fi
  fi
}

echo Guess the secret number between 1 and 1000:
GUESS_NUMBER
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"