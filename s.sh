#!/bin/bash

NUM_COMMITS=50

# Function to generate a random date between 2023 and 2024
generate_random_date() {
    # Generate random month, day, and time
    MONTH=$(($RANDOM % 12 + 1))
    DAY=$(($RANDOM % 28 + 1))
    HOUR=$(($RANDOM % 24))
    MINUTE=$(($RANDOM % 60))
    SECOND=$(($RANDOM % 60))

    # Return the date in the format Git expects
    printf "202%d-%02d-%02dT%02d:%02d:%02d\n" $((3 + $RANDOM % 2)) $MONTH $DAY $HOUR $MINUTE $SECOND
}

# Generate the commits
for (( i=1; i<=NUM_COMMITS; i++ ))
do
    # Create a fake file update
    echo "Fake update $i" > "fake_file_$i.txt"

    # Add the file to the staging area
    git add "fake_file_$i.txt"

    # Generate a random date for the commit
    RANDOM_DATE=$(generate_random_date)

    # Commit the change with the random date
    GIT_COMMITTER_DATE="$RANDOM_DATE" GIT_AUTHOR_DATE="$RANDOM_DATE" git commit --date="$RANDOM_DATE" -m "Fake commit $i"
done

echo "$NUM_COMMITS fake commits with randomized dates between 2023 and 2024 have been created."

# Fake git history
# GIT_AUTHOR_DATE="2022-10-05T12:00:00" GIT_COMMITTER_DATE="2022-10-05T12:00:00" git commit -am "Your commit message"
