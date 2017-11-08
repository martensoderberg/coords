#!/bin/bash

outfile=shortlist.txt
maxcount=80

echo "Country, Latitude, Longitude" > $outfile

count=0
current_cc=""
while read line
do
  this_cc=$(echo $line | cut -d "," -f 1)
  #echo $this_cc
  if [[ "$current_cc" != "$this_cc" ]]; then
    #echo "NEW CC"
    count=$((0))
  elif [[ "$count" -ge "$maxcount" ]]; then
    #echo "maxcount exceeded"
    :
    # do nothing
  else
    this_lat=$(echo $line | cut -d "," -f 6)
    this_long=$(echo $line | cut -d "," -f 7)
    echo "$this_cc,$this_lat,$this_long" >> $outfile
    count=$(($count+1))
  fi
  #echo $count
  current_cc=$this_cc
done < "worldcitiespop.txt"