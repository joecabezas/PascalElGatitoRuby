#!/bin/bash
# /etc/init.d/twittercamdaemon.sh

### BEGIN INIT INFO
# Provides:          twittercamdaemon
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Example initscript
# Description:       <description pending>
### END INIT INFO


case "$1" in 
    start)
        echo "Starting twittercamdaemon"
	sudo ruby /home/pi/git/PascalElGatitoRuby/Daemon.rb start
        ;;
    stop)
        echo "Stopping twitercamdaemon"
	sudo ruby /home/pi/git/PascalElGatitoRuby/Daemon.rb stop
        ;;
    status)
	echo "Status"
	sudo ruby /home/pi/git/PascalElGatitoRuby/Daemon.rb status
	;;
    *)
        echo "Usage: /etc/init.d/twittercamdaemon.sh start|stop|status"
        exit 1
        ;;
esac

exit 0
