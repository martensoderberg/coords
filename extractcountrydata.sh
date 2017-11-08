#!/bin/bash

outpath="cc-specific"

current_cc=""
while read line
do
  this_cc=$(echo $line | cut -d "," -f 1)
  this_lat=$(echo $line | cut -d "," -f 6)
  this_long=$(echo $line | cut -d "," -f 7)
  echo "$this_lat, $this_long" >> "$outpath/$this_cc"
done < "worldcitiespop.txt"