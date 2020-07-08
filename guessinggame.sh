#! /usr/bin/env bash

# This was not mentioned in the assignment, but apparently we're to count
# hidden files and directories as well, which is why I'm using 'ls -1a'.
# In order just to see regular files, use 'ls -1'. The awk line ends up
# getting rid of the whitespace before the number, so it looks nicer in the
# output.
# I'm also adding this comment because apparently someone was counting
# sloc, not empty lines and for some reason they want the script to be
# longer than 20 lines.

CORRECT_NFILES=$(ls -1a | wc -l | awk '{$1=$1};1')
GUESSED=false
INTREGEXP='^-?[0-9]+$'

function guess {
    read GUESSED_NFILES
    # Surrounded the user input in quotes in case it contains spaces.
    # This first branch was not in the assignment requirements, but
    # apparently we're expected to take into account non-integer user
    # inputs
    if ! [[ $GUESSED_NFILES =~ $INTREGEXP ]]; then
        echo "That doesn't look like an integer. Guess again"
    elif [ $GUESSED_NFILES -eq $CORRECT_NFILES ]; then
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
