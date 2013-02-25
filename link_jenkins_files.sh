#!/bin/bash
find jenkins-home-dir -mindepth 1 | while read ENTRY; do
LINK_NAME=~/$(echo $ENTRY|sed -e "s^jenkins-home-dir/^^")
ENTRY=$(pwd)/$ENTRY
if [ -d $ENTRY ]; then
	echo Directory 
	if ! [ -d $LINK_NAME ]; then
		mkdir $LINK_NAME;
	fi
else 
	echo Regular file
	rm -v $LINK_NAME
	ln -v $ENTRY $LINK_NAME
fi
done
