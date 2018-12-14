#!/bin/sh
##---------------------
## This script restores the original state of /opt/activemq,
## copies all files and directories from /execution-core-container to /opt/activemq
## and starts Apache ActiveMQ with configuration file /opt/activemq/conf/activemq.xml.
##---------------------

print_usage() {
    echo "Usage" `basename "$0"` "[OPTIONS]"
    echo
    echo "Options:"
    echo "  -d, --delete-activemq-data   If set all content of the data directory of"
    echo "                                 ActiveMQ (e.g. /opt/activemq/data) will be"
    echo "                                 removed on startup."
    echo "  -h --help                   display this help text and exit"
}

set -e #Exit immediately if a command exits with a non-zero status.

if [ $# -gt 1 ] ; then
    echo "Too many arguments (max 1)!"
    exit 1
elif [ "$1" = "--help" ] || [ "$1" = "-h" ] ; then
    print_usage
    exit
else
    #restore original state of activemq home directory but keep data and copy activemq config files
    rsync -a --checksum --delete --force --exclude=data /execution-core-container/ /opt/.activemq_bak/ /opt/activemq/
    if [ "$1" = "--delete-activemq-data" ] || [ "$1" = "-d" ] ; then
        #restore original state of activemq data directory
        rsync -a --checksum --delete --force /opt/.activemq_bak/data/ /opt/activemq/data/
    fi
fi

#run activemq
exec /opt/activemq/bin/activemq console xbean:conf/activemq.xml