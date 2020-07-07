#! /usr/bin/env bash

CORRECT_NFILES=$(ls | wc -l | awk '{$1=$1};1')
GUESSED=false

function guess {
    read GUESSED_NFILES
    if [ $GUESSED_NFILES -eq $CORRECT_NFILES ]; then
        echo "Congratulations. You're right!"
        GUESSED=true
    elif [ $GUESSED_NFILES -lt $CORRECT_NFILES ]; then
        echo "Too low. Guess again."
    else
        echo "Too high. Guess again."
    fi
}

echo "Step right up! How many files do you think are in this directory?"
while [ $GUESSED == false ]; do
    guess
done

echo "There are indeed $CORRECT_NFILES files in this directory"
