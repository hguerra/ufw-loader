#! /bin/bash

count=1
countries=( ua.txt cn.txt ru.txt nl.txt )

for i in "${countries[@]}"
do
  file=$i
  nblines=$(grep -c '' $file)

  while read p; do
    echo $count of $nblines
    sudo ufw deny from $p to any
    let "count+=1"
  done <$file
done


