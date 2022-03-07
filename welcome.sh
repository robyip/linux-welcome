#!/bin/bash

# TODO
# ====
# If logged in for the first time  today say hello good to see you today.
# 
# If logged in to linux same day but different  session then say welcome back I hope you had nice break from Ubuntu Linux
# 
#  If date in file different then 
#  	Hello Rob I hope you have a nice day
#	Set the date s field in JSON
#	set uptime field for the 1at log in of the day
#  else
#   	if (Check uptime different current uptime)
#		Message = "Good to see you again today"
#		set uptime field
#  end
#
# 	Write and read json file

# gnome-terminal -- "bash -c 'echo Hello World; sleep 5'"

# Get the session uptime since date time
start_of_current_session=$(uptime -s)

read -ra array <<< ${start_of_current_session}
# check array length to see if successful operation so can proceed
arraylength=${#array[@]}
if [[ ${arraylength} -eq 2 ]]
then
	echo "hurrah array length = ${arraylength}"
	uptime_since_date=${array[0]}
else
	echo "error with array"
fi

# debug
echo "start_of_current_session = ${start_of_current_session}"
echo "start_of_current_session_date = ${uptime_since_date}"



# check if json querying package is installed
REQUIRED_PKG="jq"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG | grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG
fi

# check if file exists then do the check to see if start of the dat or returning

# assume start of the day because no file

# 
file_name="uptime.json" 
if [[ -f "${file_name}" ]]
then
	echo "Uptime json file ${file_name} exists!"
else

	echo "File ${file_name} doesn't exists"
fi



# read a json object from file

# extract value from the json object

# save to a json object if need to

# only show message is conditions are met and the read waits for user to hit enter
# echo "Hello World! press enter to continue"
# read




