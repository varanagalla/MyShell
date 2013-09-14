#!/bin/sh
#
# SCRIPT: co_process_demo.sh
# AUTHOR: VARAPRASAD NAGALLA
# DATE:   09/10/2013
# REV:    1.1.A 
#
# PLATFORM: Not platform dependent
#
# REQUIREMENTS: 
#
# PURPOSE: This script demoes the co-processing. Co-Process is a communication link
# between FOREGROUND and BACKGROUND processes.
#
# REV LIST:
#
#
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do not forget to put the # comment back in or
#          #       the shell script will never execute!
# set -x   # Uncomment to debug this shell script
#
##########################################################
#         DEFINE FILES AND VARIABLES HERE
##########################################################
TOTAL_SECONDS=300
BREAKOUT='N'

##########################################################
#              DEFINE FUNCTIONS HERE
##########################################################
function trap_exit
{
	# Tell the co-process to break out of the loop
	echo "Quitting now."
	BREAK_OUT='Y'
	print -p $BREAK_OUT # Use "print -p" to talk to the co-process
}

function proc_watch
{
# This function is started as a co-process!!!
		while :
		do
			echo -e ".\c"
			sleep 1
			read $BREAK_OUT # DO NOT need a "-p" to read!
			if [[ $BREAK_OUT = 'Y' ]]
			then
					return 0
			fi
		done
					
}

##########################################################
#               BEGINNING OF MAIN
##########################################################

### Set a Trap ###

trap 'trap_exit; exit 2' 0 1 SIGINT 3 15 19

proc_watch 2>1&
# Start pro_watch as a co-process!!!!!

PW_PID=$1     # Process ID of the last background job

until (( TOTAL_SECONDS == 0 ))
do
	(( TOTAL_SENDS -= 1 ))
	sleep 1
done
	
	BREAK_OUT='Y'
	
	# Use "print -p" to communicate with the co-process variable
	
	print -p $BREAK_OUT
	
	kill $PW_PID # Kill the background co-process
	
	exit 0

# End of script

