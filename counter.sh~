#!/bin/bash
#
# SCRIPT: NAME_of_SCRIPT
# AUTHOR: AUTHORS_NAME
# DATE:   DATE_of_CREATION
# REV:    1.1.A (Valid are A, B, D, T, Q, and P)
#               (For Alpha, Beta, Dev, Test, QA, and Production)
#
# PLATFORM: (SPECIFY: AIX, HP-UX, Linux, OpenBSD, Solaris, other flavor, 
#                      or Not platform dependent)
#
# REQUIREMENTS: If this script has requirements that need to be noted, this
#               is the place to spell those requirements in detail. 
#
#         EXAMPLE:  OpenSSH is required for this shell script to work.
#
# PURPOSE: Give a clear, and if necessary, long, description of the
#          purpose of the shell script. This will also help you stay
#          focused on the task at hand.
#
# REV LIST:
#        DATE: DATE_of_REVISION
#        BY:   AUTHOR_of_MODIFICATION
#        MODIFICATION: Describe what was modified, new features, etc--
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

THIS_SCRIPT=$(basename $0)
ECHO=echo

##########################################################
#              DEFINE FUNCTIONS HERE
##########################################################
 function elapsed_time() {
	 SEC=$1
	 
	 (( SEC < 60 )) && $ECHO "[Elapsed time: $SEC seconds]\c"
	 
	 (( SEC >= 60 && SEC < 3600 )) && $ECHO "[Elapse time: $(( SEC/60 )) min $(( SEC%60 )) sec] \c"
	 
	 (( SEC > 3600 ))  && $ECHO "[Elapsed time: \
	 $(( SEC/3600 )) hr $(( (SEC % 3600) / 60 )) min\ $((
	 (SEC % 3600)%60 )) sec]\c"
 }
 
 function trap_exit() {
	 kill $BG_PID
	 echo "Killed PID ::  $BG_PID"
 }
 
 function start_counter() {
	LIMIT=$1
	 
	 until (( LIMIT < SECONDS )) 
    do
    	  clear
	     elapsed_time $(( LIMIT  -  SECONDS ))
	     sleep 1
    done
    echo 
    
    echo $( cat success.txt )
    
 }

##########################################################
#               BEGINNING OF MAIN
##########################################################

# trap 'trap_exit; exit 2' 1 2 SIGINT 
SECONDS=0

max=$1

start_counter $max &

BG_PID=$!

# sleep $max

# kill $BG_PID

# End of script

