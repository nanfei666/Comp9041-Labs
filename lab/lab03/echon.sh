#!/bin/sh
if test $# != 2
then echo "Usage: ./echon.sh <number of lines> <string>"
else
if (($1>=0))
then 
for ((i =1; i<=$1;i++))
do
echo $2
done
else
echo "./echon.sh: argument 1 must be a non-negative integer"
fi
fi
