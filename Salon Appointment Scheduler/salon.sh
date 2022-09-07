#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Shop ~~~~~\n"

MAIN_MENU() {
  #get services
  SERVICES=$($PSQL "SELECT service_id,name FROM services ORDER BY service_id")

  #display services
  echo -e "\nHere are the treatments we have available:"
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
  
  #ask for service to pick
    echo -e "\nWhich one service would you like to take, please enter the number id of the service?"
    read SERVICE_ID_SELECTED
  #get the service name required
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    #if input is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
    #send to main menu
      MAIN_MENU "That is not a valid service number."
    else
      #get customer info
      echo -e "\nWhat's your phone?"
      read CUSTOMER_PHONE

      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      #if customer doesn't exist
       if [[ -z $CUSTOMER_NAME ]]
       then
         #get new customer name
         echo -e "\nWhat's your name?"
         read CUSTOMER_NAME

         #insert new customer
         INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')") 
       fi
      
      #get time reservation
      echo -e "\nWhich time do you want to reserve?"
      read SERVICE_TIME

      #get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      #insert service pickup
      INSERT_PICKUP_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
}

MAIN_MENU
