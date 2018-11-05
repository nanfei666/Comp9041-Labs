#!/bin/sh

name=$1
count=0
#echo $name
copyed_name=".$name.$count"
#echo $copyed_name
while true
do
if test -e $copyed_name
then
  count=`expr $count + 1`
  copyed_name=".$name.$count"
  
else
  cp $1 $copyed_name
  echo "Backup of 'n.txt' saved as $copyed_name"
  break
fi
done
