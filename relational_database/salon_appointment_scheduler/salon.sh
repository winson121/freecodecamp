#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  echo -e "Welcome to My Salon, how can I help you?\n"
  SERVICE_MENU
}

SERVICE_MENU() {
  if [[ -n $1 ]]
  then
    echo -e "\n$1"
  fi

  # get available services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  # if no service found
  if [[ -z SERVICES ]] 
  then
    echo -e "\nSorry, there are no services available for now. We are closed"
  else
    echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done

    read SERVICE_ID_SELECTED
    # if service id selected not valid, send to service menu
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      SERVICE_MENU "I could not find that service. What would you like today?"
    else
      # get service availability
      SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

      # if service name is empty, return to service menu
      if [[ -z $SERVICE_NAME_SELECTED ]]
      then
        SERVICE_MENU "I could not find that service. What would you like today?"
      else
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        # if customer does not exist, insert new customer
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        if [[ -z $CUSTOMER_NAME ]]
        then
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME
          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        fi

        # get customer id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # set appointment time
        echo -e "\nWhat time would you like your $(echo $SERVICE_NAME_SELECTED | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME

        # create appointments for customer
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

        echo -e "\nI have put you down for a $(echo $SERVICE_NAME_SELECTED | sed 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
      fi
    fi
  fi
}

MAIN_MENU
