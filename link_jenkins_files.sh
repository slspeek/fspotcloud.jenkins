#!/bin/bash
find jenkins-home-dir -mindepth 1 | while read ENTRY; do
TARGET=$ENTRY
LINK_NAME=~/$(echo $ENTRY|sed -e "s^jenkins-home-dir/^^")
rm -v $LINK_NAME
ln -s $ENTRY $LINK_NAME
done
