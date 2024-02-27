#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SELECT_SERVICE(){
  SERVICES_AVAILABLE=$($PSQL "select * from services")
  SERVICES_COUNT=$($PSQL "select count(*) from services")
  echo -e "\nServices:"
  echo "$SERVICES_AVAILABLE" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+ || $SERVICE_ID_SELECTED > $SERVICES_COUNT ]]
  then
    SELECT_SERVICE

  else
    echo -e "\nPhone number:"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nEnter a name:"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi

    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")

    echo -e "\nTime for the service?"
    read SERVICE_TIME

    SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
    
    INSERT_APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SELECT_SERVICE