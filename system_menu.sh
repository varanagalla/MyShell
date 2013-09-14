#!/bin/sh
#
# SCRIPT: system_menu.sh
# AUTHOR: VARAPRASAD NAGALLA
# DATE:   09/11/2013
# REV:    1.1.A 
#
# PLATFORM:  Not platform dependent
#
# PURPOSE:  This script demoes the usage of select command.
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
 

##########################################################
#               BEGINNING OF MAIN
##########################################################

# clear the screen
clear

# Display the menu title header
echo "\n\tSYSTEM INFORMATION MENU\n"

# Define the menu prompt
PS3="Select an option and press Enter: "

# The select command defines what the menu
# will look like

select i in OS Host Filesystems Date Users Quit
do
	case $i in
	
		OS)  echo
			  uname
			  ;;
			  
	 Host)  echo
	 		  hostname
	 		  ;;
	 
	 Filesystems)
	 		  echo
	 		  df -k | more
	 		  ;;
	 		  
	 Date)  echo
	 		  date
	 		  ;;
	 
	 Users) echo
	 		  who
	 		  ;;
	 		 
	  Quit) break
	  		  ;;
	  		  
	  esac 	
	  

# Setting the select command's REPLY variable
# to NULL causes the menu to be redisplayed
	  
 REPLY=	  

# Pause before redisplaying the menu

 echo "\nPress Enter to Continue...\c"
 read

# Ready to redisplay the menu again

# clear the screen

 clear

# Display the menu title header

 echo "\n\tSYSTEM INFORMATION MENU\n"
	 
done

# Clear the screen before exiting

clear



# End of script

