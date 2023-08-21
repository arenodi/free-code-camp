#!/bin/bash
# Number guessing game
# Variable to access database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
TBL_JOIN="FROM guesses INNER JOIN users USING(user_id)"

# Function to test guess with random number
LOWER_OR_HIGHER() {
  # If guess is lower then rNum
  if [[ $1 -lt $2 ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $1 -gt $2 ]]
  then
    echo "It's lower than that, guess again:"
  fi
}

IS_NUMBER() {
  # If is number
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    LOWER_OR_HIGHER $1 $2
  fi
}

# Generate random number
R_NUMBER=$((1+$RANDOM % 1000))
# Variable to store number of tries
COUNTER=0
# Ask for username
echo "Enter your username:"
read USERNAME
# Get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USERNAME';")
# If not found
if [[ -z $USER_ID ]]
then
  # Insert into table
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES('$USERNAME');")
  # While error read username
  while [[ $INSERT_USER_RESULT != "INSERT 0 1" ]]
  do
    echo -e "\nUsername must be 22 characters long or less, please try again:"
    read USERNAME
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES('$USERNAME');")
  done
  # Get new user id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USERNAME';")
  # Print first timer welcome message
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Get lowest number of guesses
  BEST_SCORE=$($PSQL "SELECT MIN(num_of_tries) FROM guesses WHERE user_id = $USER_ID")
  # Get number of games
  GAMES_COUNT=$($PSQL "SELECT COUNT(*) FROM guesses WHERE user_id = $USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $BEST_SCORE guesses."
fi
# Ask for first guess
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
COUNTER=$((COUNTER + 1))
while [[ $USER_GUESS != $R_NUMBER ]]
do
  IS_NUMBER $USER_GUESS $R_NUMBER
  read USER_GUESS
  COUNTER=$((COUNTER + 1))
done
echo "You guessed it in $COUNTER tries. The secret number was $R_NUMBER. Nice job!"
INSERT_GAME_RESULT=$($PSQL "INSERT INTO guesses(user_id, num_of_tries) VALUES($USER_ID, $COUNTER);")
