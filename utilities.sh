#!/bin/sh
#
# SCRIPT: utilities.sh
# AUTHOR: VARAPRASAD NAGALLA
# DATE:   09/11/2013
# REV:    1.1.A 
#
# PLATFORM:  Not platform dependent
#
# 
#
# PURPOSE: This script collates the basic library functions that can be used
# for all general purpose tasks.
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


##########################################################
#              DEFINE FUNCTIONS HERE
##########################################################
 function elapsed_time() {
	SEC=$1
	((SEC < 60)) && echo "[Elapsed time: $SEC seconds]\c"
	
	((SEC >= 60 && SEC < 3600 )) && echo "[Elapsed time: $(( SEC/60 )) \
	min $(( SEC %60 )) sec]]\c"
	
	(( SEC > 3600 )) && echo "[Elapsed time: $(( SEC/3600 )) hr \
	$(( (SEC % 3600) / 60 )) min $(( (SEC % 3600) % 60 )) sec]\c"
}

function create_random_number() {
	RANDOM=$$				# Initialize the seed to the PID of script.
	UPPER_LIMIT=$1
   LOWER_LIMIT=$2
	
	RANDOM_NUMBER=$(( $RANDOM % $UPPER_LIMIT + $LOWER_LIMIT ))
	echo "$RANDOM_NUMBER"
}

function highlight_key() {
   	SOURCE_FILE=$1
   	KEY_WORD=$2
	
	cat  $SOURCE_FILE | sed s/"$KEY_WORD"/$(tput smso)"$KEY_WORD"$(tput rmso)/g 
	   	
}

function find_large_files() {
	HOLD_FILE=/tmp/largefiles.list
	MEG_BYTES=$1
	SEARCH_PATH=$2
	
	find $SEARCH_PATH -type f -size +${MEG_BYTES}000000c -print > $HOLD_FILE
	
	cat $HOLD_FILE
}

##########################################################
#               BEGINNING OF MAIN
##########################################################



# SECS_INPUT=$(sh convert_to_secs_v2.sh -s100 -m100 -h3 -d0)

# elapsed_time $SECS_INPUT

# create_random_number 100 10

# highlight_key /etc/hosts local

find_large_files 10 /Users/vpsrini/IDT

# End of script

