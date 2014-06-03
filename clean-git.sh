#!/bin/sh

################################################################################
# Stop #0: Data repository models
################################################################################
CLEANUP_DIRS="/Library/WebServer/Documents/"

################################################################################
# Step #1: Check the command dependency
################################################################################
CMDS="find git xargs"
for i in $CMDS
do
	command -v $i > /dev/null && continue || { echo "$i command not found!"; exit 1;}
done

################################################################################
# Step #2: Clean up git dirs
################################################################################
for i in `find $CLEANUP_DIRS -type d -name .git -type d`
do
	printf "Cleaning up %s \n" $i;
	cd $i && git gc -q;
done;
