#!/bin/bash

# Variables

path=/home/ubuntu/audios/  # should end with slash
tmp_file=/tmp/temp.txt     # Temporary file to store filenames
days_to_find=2             # Number of days i.e 24*n
log_file_name=/tmp/deleted-files-$(date +%d-%m-%Y).log # path of log file


#######################

find $path -mtime +$days_to_find -printf "%T@" -ls | tac > $tmp_file  # finding files older than mentioned days
sed -i '$d' $tmp_file 
while read line 
do
    # echo "$line" | awk '{ print $1 }'
    file=$(echo "$line"  | awk '{ print $12 }')
    created_timestamp=$(echo "$line"  | awk '{ print $1 }')
    created_time=$(date +%d-%m-%YT%T%:::z -d @$created_timestamp )
    deleted_time=$(date +%d-%m-%YT%T%:::z) && rm -r $file
    status=$?
    while [ $status -eq 0 ]
    do
    sudo echo "$file $created_time $deleted_time" >> $log_file_name
    break
    done
done < $tmp_file
