#!/bin/bash 
function scan ()
{
  host=$1
  printf '%s' "$host"                                      
  for ((port=1;port<1024;port++))
  do
    # order of redirects is important for 2 reasons
    echo >/dev/null 2>&1  < /dev/tcp/${host}/${port}        
    if (($? == 0)) ; then printf ' %d' "${port}" ; fi       
  done
  echo # or printf '\n'
}

#
# main loop
#    read in each host name (from stdin)
#     and scan for open ports
#    save the results in a file
#    whose name is supplied as an argument
#     or default to one based on today's date
#

printf -v '$host'                 #file is modified here to create a file name with the IP address instead of the date. 
OUTFILE=${1:-$HOST}                                      

while read HOSTNAME
do
    scan $HOSTNAME
done > $OUTFILE 
