#!/bin/bash

### BEGIN INIT INFO
# Provides:          TwitterCam
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Example initscript
# Description:       <description pending>
### END INIT INFO

cd /home/pi/git/PascalElGatitoRuby/

case "$1" in 
    start)
        echo "Starting TwitterCam"
	sudo ruby /home/pi/git/PascalElGatitoRuby/Daemon.rb start
        ;;
    stop)
        echo "Stopping TwitterCam"
	sudo ruby /home/pi/git/PascalElGatitoRuby/Daemon.rb stop
        ;;
    status)
	echo "TwitterCam status"
	sudo ruby /home/pi/git/PascalElGatitoRuby/Daemon.rb status
	;;
    *)
        echo "Usage: service TwitterCam (start|stop|status)"
        exit 1
        ;;
esac

exit 0
