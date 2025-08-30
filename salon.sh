#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

LIST_SERVICES() {
  SERVICES="$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")"
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
do
  if [[ $SERVICE_ID ]]
  then
  echo "$SERVICE_ID) $(echo "$SERVICE_NAME" | sed -E 's/^ *| *$//g')"
  fi                                          
done
}

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  LIST_SERVICES

  read SERVICE_ID_SELECTED

  SERVICE_NAME="$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")"
  SERVICE_NAME="$(echo "$SERVICE_NAME" | sed -E 's/^ *| *$//g')"

  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
    return
  fi

  echo -r "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")"
  CUSTOMER_ID="$(echo "$CUSTOMER_ID" | sed -E 's/^ *| *$//g')"

  if [[ -z $CUSTOMER_ID ]]
  then 
    echo -e "\nI don't have record for that phone number, what's your name?"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_RESULT="$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")"
  
    CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")"
    CUSTOMER_ID="$(echo "$CUSTOMER_ID" | sed -E 's/^ *| *$//g')"
  else
    CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID'")"
  fi

  CUSTOMER_NAME="$(echo "$CUSTOMER_NAME" | sed -E 's/^ *| *$//g')"

  echo -e "\nWhat time would you like your $SERVICE_NAME?"
  read SERVICE_TIME

INSERT_APPT_RESULT="$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMER_ID','$SERVICE_ID_SELECTED', '$SERVICE_TIME')")"

echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU