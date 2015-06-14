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
        ;;
    stop)
        echo "Stopping twitercamdaemon"
        ;;
    status)
	echo "Status"
	;;
    *)
        echo "Usage: /etc/init.d/twittercamdaemon.sh start|stop"
        exit 1
        ;;
esac

exit 0
