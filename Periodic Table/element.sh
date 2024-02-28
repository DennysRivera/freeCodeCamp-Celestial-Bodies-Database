#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    if [[ ${#1} -le 2 ]]
    then
      ELEMENT_INFO=$($PSQL "select * from elements full join properties using(atomic_number) full join types using(type_id) where
symbol = '$1'")
      if [[ -z $ELEMENT_INFO ]]
      then
        echo I could not find that element in the database.
      else
        echo "$ELEMENT_INFO" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
        done
      fi
    else
      ELEMENT_INFO=$($PSQL "select * from elements full join properties using(atomic_number) full join types using(type_id) where
name = '$1'")
      if [[ -z $ELEMENT_INFO ]]
      then
        echo I could not find that element in the database.
      else
        echo "$ELEMENT_INFO" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
        done
      fi
    fi
  else
    ELEMENT_INFO=$($PSQL "select * from elements full join properties using(atomic_number) full join types using(type_id) where
atomic_number = $1")
    if [[ -z $ELEMENT_INFO ]]
    then
      echo I could not find that element in the database.
    else
      echo "$ELEMENT_INFO" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
      done
    fi
  fi
else
  echo Please provide an element as an argument.
fi