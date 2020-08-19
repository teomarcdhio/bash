#!/bin/bash

STATUS=$(systemctl is-active nginx)
echo $STATUS
while [ "$STATUS" != "active" ];
do
        STATUS=$(systemctl is-active nginx)
        echo $STATUS
        sleep 10
        sudo service nginx start 
done
