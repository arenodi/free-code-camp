#!/bin/bash

# Variable to query data
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
# Variable to query on joined tables
Q_JOINED="FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id)"

DISPLAY_INFORMATION() {
  # Necessary Args
  if [[ $1 && $2 && $3 && $4 && $5 && $6 && $7 ]]
  then
    # Display message
    echo -e "The element with atomic number $1 is $2 ($3). It's a $4, with a mass of $5 amu. $2 has a melting point of $6 celsius and a boiling point of $7 celsius."
  fi
}

if [[ $1 ]]
then
  # If is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER="$1"
    # Get data by atomic number
    ELEMENT_NAME=$($PSQL "SELECT name $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
    # If not found
    if [[ -z $ELEMENT_NAME ]]
    then
      echo -e "\nI could not find that element in the database."
    else
      # Get symbol
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
      # Get type
      ELEMENT_TYPE=$($PSQL "SELECT type $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
      # Get mass
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
      # Get melting point in celsius
      ELEMENT_M_P_C=$($PSQL "SELECT melting_point_celsius $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
      # Get boiling point in celsius
      ELEMENT_B_P_C=$($PSQL "SELECT boiling_point_celsius $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
      # Display Info about element
      DISPLAY_INFORMATION $ATOMIC_NUMBER $ELEMENT_NAME $ELEMENT_SYMBOL $ELEMENT_TYPE $ELEMENT_MASS $ELEMENT_M_P_C $ELEMENT_B_P_C
    fi
  else
    # If arg $1 is not number AND is less or equal then 2 characters
    if [[ ! $1 =~ [0-9]+ && ${#1} -le 2 ]]
    then
      ELEMENT_SYMBOL="$1"
      # Get data by symbol
      ELEMENT_NAME=$($PSQL "SELECT name $Q_JOINED WHERE symbol='$ELEMENT_SYMBOL';")
      # If not found
      if [[ -z $ELEMENT_NAME ]]
      then
        echo -e "\nI could not find that element in the database."
      else
        # Get atomic number
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number $Q_JOINED WHERE symbol='$ELEMENT_SYMBOL';")
        # Get type
        ELEMENT_TYPE=$($PSQL "SELECT type $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
        # Get mass
        ELEMENT_MASS=$($PSQL "SELECT atomic_mass $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
        # Get melting point in celsius
        ELEMENT_M_P_C=$($PSQL "SELECT melting_point_celsius $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
        # Get boiling point in celsius
        ELEMENT_B_P_C=$($PSQL "SELECT boiling_point_celsius $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
        # Display Info about element
        DISPLAY_INFORMATION $ATOMIC_NUMBER $ELEMENT_NAME $ELEMENT_SYMBOL $ELEMENT_TYPE $ELEMENT_MASS $ELEMENT_M_P_C $ELEMENT_B_P_C
      fi
    else
      # If arg $1 is not number AND is greather then 2 characters
      if [[ ! $1 =~ [0-9]+ && ${#1} -gt 2 ]]
      then
        ELEMENT_NAME="$1"
        # Get data by symbol
        ELEMENT_SYMBOL=$($PSQL "SELECT symbol $Q_JOINED WHERE name='$ELEMENT_NAME';")
        # If not found
        if [[ -z $ELEMENT_SYMBOL ]]
        then
          echo -e "\nI could not find that element in the database."
        else
          # Get atomic number
          ATOMIC_NUMBER=$($PSQL "SELECT atomic_number $Q_JOINED WHERE symbol='$ELEMENT_SYMBOL';")
          # Get type
          ELEMENT_TYPE=$($PSQL "SELECT type $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
          # Get mass
          ELEMENT_MASS=$($PSQL "SELECT atomic_mass $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
          # Get melting point in celsius
          ELEMENT_M_P_C=$($PSQL "SELECT melting_point_celsius $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
          # Get boiling point in celsius
          ELEMENT_B_P_C=$($PSQL "SELECT boiling_point_celsius $Q_JOINED WHERE atomic_number=$ATOMIC_NUMBER;")
          # Display Info about element
          DISPLAY_INFORMATION $ATOMIC_NUMBER $ELEMENT_NAME $ELEMENT_SYMBOL $ELEMENT_TYPE $ELEMENT_MASS $ELEMENT_M_P_C $ELEMENT_B_P_C
        fi
      else
        echo -e "\nI could not find that element in the database."
      fi
    fi
  fi
else
  # Request argument
  echo -e "\nPlease provide an element as an argument."
fi