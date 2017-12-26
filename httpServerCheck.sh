#!/bin/bash

echo "Starting httpServerCheck script"

sleep 5 && while true 
do 
# collect the http response code from a curl request
httpResponse=$(curl -D - 'yourServer.com' 2> /dev/null | head -1)
date >> httpServerCheck.txt
echo $httpResponse >> httpServerCheck.txt
httpCode=$(echo $httpResponse | awk '{print $2}')
echo $httpCode
if [ $httpCode != "200" ]
then

# send an email using sendmail
echo "From: your@email.com" >> mail.txt
echo "To: destination@gmail.com" >> mail.txt
echo "Subject: The server is not responding correclty; I'm getting a $httpResponse code." >> mail.txt
sendmail -vt < mail.txt
rm mail.txt

# send email using mail 
# echo "The server is not responding correclty; I'm getting a $httpResponse code."| mail -s "Server error" -a "From: your@email.com" destination@email.com


fi
sleep  10
done

