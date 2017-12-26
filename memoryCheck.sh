#!/bin/bash

echo "Starting memeoryCheck script"

# start the loop 
sleep 5 && while true 
# collect date and free memory and write to memLog file
do 
date >> memLog.txt
free -h >> memLog.txt
# wait 10 mins and go again
sleep 600
done

