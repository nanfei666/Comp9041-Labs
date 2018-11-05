#!/bin/sh

FOLDER_A=$1
FOLDER_B=$2
for file_a in $1/*;
do
  a=$(echo "$file_a"| sed s'/.*\///')

  if [[ -e "$2/$a" ]]; then
    diff "$1/$a" "$2/$a" >/dev/null
    if [[ $? -eq 0 ]];
    then
        echo "$a"
  fi
fi
done
