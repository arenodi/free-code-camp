#!/bin/bash

# Program to manage salon appointments

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# echo "$($PSQL "SELECT * FROM services ORDER BY service_id;")"

MAIN_MENU() {
  # Check if there is argument
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi
  # Greeting text
  echo -e "\nWelcome to Arenodi's salon, How can I help you?\n"
  # Get list of services
  SERVICES_OFFERED=$($PSQL "SELECT * FROM services ORDER BY service_id;")
  echo "$SERVICES_OFFERED" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  # Check if input is a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Sorry, that is an invalid option. Please, try again."
  else
    # Get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
    # Ask for phone number
    echo -e "\nPlease, inform your phone number:"
    read CUSTOMER_PHONE
    # Get customer name
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    # If name not found
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nSorry, we did not find it in our database...Let's register it!"
      # Ask for customer name
      echo -e "\nWhat is your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
      # If insert sucessful
      if [[ $INSERT_CUSTOMER_RESULT = "INSERT 0 1" ]]
      then
        # Echo succsessful mesage
        echo -e "\nYou were registered successfully, $CUSTOMER_NAME!"
        # Get new customer id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      fi
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID;")
    fi
    # Ask for what time
    echo -e "\nWhat time?"
    read SERVICE_TIME
    # Create appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
    # if successful
    if [[ $INSERT_APPOINTMENT_RESULT = "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g' | tr '[:upper:]' '[:lower:]') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    fi
  fi
  
}

MAIN_MENU