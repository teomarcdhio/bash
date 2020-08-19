#!/bin/bash
### BEGIN INIT INFO
# Provides:       nginxstatus
# Required-Start:    \$local_fs \$syslog
# Required-Stop:     \$local_fs \$syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts nginxstatus
# Description:       starts nginxstatus using start-stop-daemon
### END INIT INFO
STATUS=$(systemctl is-active nginx)
echo $STATUS
while [ "$STATUS" != "active" ];
do
        STATUS=$(systemctl is-active nginx)
        echo $STATUS
        sleep 20
        sudo service nginx start 
done
