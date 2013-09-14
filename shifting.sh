#!/bin/sh
#
# SCRIPT: shifting.sh
# AUTHOR: VaraPrasad Nagalla
# DATE:   09/09/2013
# REV:    1.1.A 
#
# PLATFORM: Not platform dependent
# 
#
#
# PURPOSE: This script is used to process all of the tokens which are
# pointed to by the command-line arguments, $1, $2, $3,etc...
#
# REV LIST:
#        
#

##########################################################
#         DEFINE FILES AND VARIABLES HERE
##########################################################

TOTAL=0 # Initialize the Total counter to zero

# Start a while loop

while true
do
	TOTAL=`expr $TOTAL + 1` # A little math in the 
														# shell script, a running
														# total of tokens processed.
														
	 TOKEN=$1   # We always point to the $1 argument with a shift
	 
	 	echo $TOKEN    # Process each TOKEN. A simple display.
	 	
	 	shift   			# Grab the next token. i.e. $2 becomes $1
	 	
	 	if [ $TOTAL == 2 ]
	 	then
	 			break
	 	else
	 		continue
	 	fi
done

echo "Total number of tokens processed: $TOTAL"



# End of script

