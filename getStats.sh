#!/bin/bash
#Author: Nikhil Da Rocha

SOCKET_PATH="/var/run/haproxy.sock"
ZERO=0
COUNTER=0


  ###sudo echo 'show stat' | sudo socat unix-connect:$SOCKET_PATH stdio \
  ###|while IFS=',' read pxname svname qcur qmax scur smax slim stot bin bout dreq dresp ereq econ eresp wretr wredis status weight act bck chkfail chkdown lastchg downtime qlimit pid iid sid throttle lbtot tracked type rate rate_lim rate_max check_status check_code check_duration hrsp_1xx hrsp_2xx hrsp_3xx hrsp_4xx hrsp_5xx hrsp_other hanafail req_rate req_rate_max req_tot cli_abrt srv_abrt comp_in comp_out comp_byp comp_rsp; do
  ###sudo echo "show stat" | sudo socat unix-connect:$SOCKET_PATH stdio 
  
  ###sudo echo "show stat" | sudo socat unix-connect:$SOCKET_PATH stdio | grep -i 'Frontend' | sed 's/,/\ /g' | awk '{print $6}'
  while [ $COUNTER -lt 3 ]; do
  	sudo echo "show stat" | sudo socat unix-connect:$SOCKET_PATH stdio \
  	|while IFS=',' read pxname svname qcur qmax scur smax slim stot bin bout dreq dresp ereq econ eresp wretr wredis status weight act bck chkfail chkdown lastchg downtime qlimit pid iid sid throttle lbtot tracked type rate rate_lim rate_max check_status check_code check_duration hrsp_1xx hrsp_2xx hrsp_3xx hrsp_4xx hrsp_5xx hrsp_other hanafail req_rate req_rate_max req_tot cli_abrt srv_abrt comp_in comp_out comp_byp comp_rsp; do
  		if [ "$svname" = 'FRONTEND' ]; then
  			curl 192.168.50.9
  			if [ "$rate" -gt $ZERO ]; then
  				echo "The current rate is ${rate}"
  				output = `echo "Nikhil, Nikhil!, the current rate is ${rate}"`
  				export output
  			else
  			    echo "Hi Nikhil Welcome"
  			fi
  		fi
  	done
  	COUNTER=$(($COUNTER+1))
  	echo "${COUNTER}"
  done


  
