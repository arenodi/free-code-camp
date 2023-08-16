#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Add data from games.csv to db worldcup
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # Check if is not the heading
  if [[ $YEAR != "year" ]]
  then
    # Get winner team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    # If not found
    if [[ -z $WINNER_ID ]]
    then
      echo "Did not find id for winner: $WINNER"
      # Inserts team into teams table
      echo $($PSQL "INSERT INTO teams(name) values('$WINNER');")
      # Get the just added team id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi
    # Get opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    # If not found
    if [[ -z $OPPONENT_ID ]]
    then
      echo "Did not find id for opponent: $OPPONENT"
      echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      # Get just added opponent team id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    fi
    # Insert games info
    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,'$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS);")
  fi
done