#!/bin/bash

echo "Starting PHPFPM check script"

sleep 5 && while true 
do 
# collect and set to phpfpm variable the amount  of php-fpm running processes
phpfpm=$(pgrep -c php-fpm)
# write date and amount of processes to phpFpmCheckLog file
date >> phpFpmCheckLog.txt
echo $phpfpm >> phpFpmCheckLog.txt
# if the amount of processes is greater or equal to 90 make anote in the phpFpmCheckLog file and restart the service
if [ $phpfpm -ge 90 ]
then
echo "More than 30 php_fpm processes running, restarting" >> runningLog.txt
service php-5.5.7-fpm restart
fi
sleep  600
done

