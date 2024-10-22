#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

NUMBER_GUESS() {
  if [[ -n $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nEnter your username:\n"
  read USERNAME
  if [[ ${#USERNAME} -gt 22 ]]
  then
    NUMBER_GUESS "Username must not be more than 22 characters!"
  else
    # get user information
    GAMES_PLAYED=0
    BEST_GAME=0
    USER=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME'")
    
    # insert to database if its new user
    IS_NEW_USER=0
    if [[ -z $USER ]]
    then
      INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
      IS_NEW_USER=1
    else
      IFS='|' read USER_ID NAME GAMES_PLAYED BEST_GAME <<< "$USER"
      GAMES_PLAYED=$(echo $GAMES_PLAYED | sed 's/^ *| *$//g')
      BEST_GAME=$(echo $BEST_GAME | sed 's/^ *| *$//g')
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi

    if [[ $IS_NEW_USER -eq 1 ]]
    then
      echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    fi

    echo -e "\nGuess the secret number between 1 and 1000:\n"

    IS_GUESSING=1
    NUMBER_OF_GUESSES=0
    SECRET_NUMBER=$(($RANDOM % 1000 + 1))
    while [[ IS_GUESSING -eq 1 ]]
    do
      read GUESS
      if [[ $GUESS =~ ^[0-9]+$ ]]
      then
        ((NUMBER_OF_GUESSES+=1))
        if [[ $GUESS -gt $SECRET_NUMBER ]]
        then
          echo -e "\nIt's lower than that, guess again:"
        elif [[ $GUESS -lt $SECRET_NUMBER ]]
        then
          echo -e "\nIt's higher than that, guess again:"
        else 
          if [[ ($BEST_GAME -eq 0) || ($BEST_GAME -gt $NUMBER_OF_GUESSES) ]]
          then
            BEST_GAME=$NUMBER_OF_GUESSES
          fi
          ((GAMES_PLAYED+=1))
          UPDATE_USER=$($PSQL "UPDATE USERS SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")
          IS_GUESSING=0
        fi
      else
        echo -e "\nThat is not an integer, guess again:\n"
      fi
    done
    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  fi
}

NUMBER_GUESS