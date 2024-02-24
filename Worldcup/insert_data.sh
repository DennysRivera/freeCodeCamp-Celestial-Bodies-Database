#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ $WINNER != winner ]]
  then
    
      #insert team
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")

    if [[ -z $WINNER_ID ]]
    then
      WINNER_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
    fi

    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
    fi

    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
    
    #echo winner_id $WINNER_ID, opponent_id $OPPONENT_ID

    #insert game
    GAME_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WGOALS, $OGOALS)")
    echo $YEAR
  fi
done