#!/bin/bash
echo "Which user would you like to delete ?"
read username


check_exist=`cat /etc/passwd | grep $username`
if [ "$check_exist" != "$NULL" ]; then
	sudo passwd -l $username
	if [ "$(pgrep -u $username)" != "$NULL" ]; then
		sudo kill -9 $(pgrep -u $username)
	fi
	sudo userdel -r $username
	echo "${green}USER WAS SUCCESSFULLY DELETED:-)"
else
	echo "${red}user doesn't exist"
fi
