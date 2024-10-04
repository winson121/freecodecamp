#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

GET_ELEMENT_INFO() {
  if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  else
    NUMERIC_ARGUMENT=-1
    if [[ $1 =~ ^[1-9]+$ ]]
    then 
      NUMERIC_ARGUMENT=$1
    fi
    SELECT_ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = (CASE WHEN '$1' ~ '^[0-9]+$' THEN CAST('$NUMERIC_ARGUMENT' AS INT) ELSE NULL END) OR symbol = '$1' OR name = '$1'")
    if [[ -z $SELECT_ELEMENT_RESULT ]]
    then
      echo "I could not find that element in the database."
    else
      echo "$SELECT_ELEMENT_RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
      do
      GET_ELEMENT_PROPERTIES $ATOMIC_NUMBER $SYMBOL $NAME
      done
    fi
  fi
}

GET_ELEMENT_PROPERTIES() {
  SELECT_ELEMENT_PROPERTIES_RESULT=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties inner join types using(type_id) WHERE atomic_number = $1")
  echo "$SELECT_ELEMENT_PROPERTIES_RESULT" | while read TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS
  do
    echo "The element with atomic number $1 is $3 ($2). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $3 has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
}
GET_ELEMENT_INFO $1
