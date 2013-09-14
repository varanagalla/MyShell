#!/bin/sh
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
IN_FILE=$1
OUTFILE=$2
##########################################################
#              DEFINE FUNCTIONS HERE
##########################################################
function cat_while_read_LINE() {
	# Method 1
	
	# Zero out the $OUTFILE
	
	>$OUTFILE
	
	cat $INFILE | while read LINE
	do
			echo "$LINE" >> $OUTFILE
			:
	done
} 

function while_read_LINE_bottom() {
	# Method 2
	
	# Zero out the $OUTFILE
	
	>$OUTFILE
	
	while read LINE
	do
		echo "$LINE" >> $OUTFILE
	done < $INFILE
	
}

function cat_while_LINE_line() {
	# Method 3
	
	# Zero out the $OUTFILE
	
	>$OUTFILE
	
	cat $INFILE | while LINE=`line`
	do
			echo "$LINE" >> $OUTFILE
			:
	done
}

function while_LINE_line_bottom() {
	# Method 4
	
	# Zero out the $OUTFILE
	
	>$OUTFILE
	
	while LINE=`line`
	do
		echo "$LINE" >> $OUTFILE
		:
	done < $INFILE
}

function while_read_LINE_bottom_FD_OUT() {

	# Best method 1.

	# Zero out the output file.

	>$OUTFILE

	exec 4<&1
	exec 1> $OUTFILE
	
	while read LINE
	do
		echo "$LINE"
	done < $IN_FILE
	
	exec 1<&4
	exec 4>&-
	
}

function while_read_LINE_FD_IN_FD_OUT() {
	
	>$OUTFILE
	
	# Associate file descriptor 4 with standart output.
	exec 4<&1
	
	# Redirect standard output to OUTFILE.
	exec 1> $OUTFILE
	
	# Associate file descriptor 3 with standard input.
	exec 3<&0
	
	# Redirect input to IN_FILE.
	exec 0< $IN_FILE
	
	while read LINE
	do
		echo "$LINE"
	done
	
	# Reclaim standard output from file descriptor 4.
	exec 1<&4
	
	# Close file descriptor 4.
	exec 4>&-
	
	# Reclaim standard input from file descriptor 3.
	exec 0<&3
	
	# Close file descriptor 3.
	exec 3>&-
	
}

function while_true_read_echo_line() {

	>$OUTFILE
	
	while true
	do
		read LINE
		echo "$LINE" > $OUTFILE
		:
	done < $IN_FILE
}



##########################################################
#               BEGINNING OF MAIN
##########################################################

echo "Processing the file....."

echo "Method --> while_read_LINE_bottom_FD_OUT "
time while_read_LINE_bottom_FD_OUT

echo "Method --> while_read_LINE_FD_IN_FD_OUT"
time  while_read_LINE_FD_IN_FD_OUT

echo "Method --> while_true_read_echo_line"
time while_true_read_echo_line



# End of script

