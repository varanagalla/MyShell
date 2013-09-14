#!/bin/sh
#
# SCRIPT: convert_to_secs_v2.sh
# AUTHOR: VARAPRASAD NAGALLA
# DATE:   09/10/2013
# REV:    1.1.A
#
# PLATFORM: Not platform dependent
#
# PURPOSE: This scripts accepts time interval as seconds:mins:hours:days:process
# and converts the interval to seconds using getopts command. This script explains
# the usage of getopts command along with case statement. 
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

SECS=0				# Initialize all to zero
# MINUTES=0
# HOURS=0
# DAYS=0
PROCESS=			# Initialize to null

##########################################################
#              DEFINE FUNCTIONS HERE
##########################################################
 

##########################################################
#               BEGINNING OF MAIN
##########################################################

while getopts :s:m:h:d:p TIMED 2>/dev/null
do
	case $TIMED in
			s) (( SECS += $OPTARG ))
					;;
			m) (( SECS += $OPTARG * 60))
				  ;;
			h) (( SECS += $OPTARG * 3600 ))
				  ;;
			d) (( SECS += $OPTARG * 86400 ))
					;;
			p) PROCESS=$OPTARG
			 		;;
		 \?) #usage
					exit 1
					;;
		esac
done

# (( TOTAL_SECONDS = SECS + MINUTES + HOURS + DAYS ))

echo $SECS # $TOTAL_SECONDS
# return $SECS

# End of script

