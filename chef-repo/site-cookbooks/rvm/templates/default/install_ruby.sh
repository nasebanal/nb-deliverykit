#!/bin/bash

#================================================================
# FILE:	install_ruby.sh
# VERSION:	1.0
# AUTHOR:	S.Yatsuzuka
#
# Copyright(c) 2015 NASEBANAL All Rights Reserved.
#================================================================


## Check the argument

if [ $# -ne 6 ] ; then
	echo "usage: $0 <Key Server> <Receive Keys> <RVM URL> <RVM Version> <Ruby Version> <Work Dir>"
	echo
	exit 1
fi


## Set Variables

KEY_URL=$1
RECV_KEYS=$2
RVM_URL=$3
RVM_VER=$4
RUBY_VER=$5
WORK_DIR=$6

LOG_HEADER="MESSAGE:"
RUBY_SET=ruby-$RUBY_VER
RVM_SH=/etc/profile.d/rvm.sh
RVM_INSTALL=1
RUBY_INSTALL=1


## Output Log

echo "$LOG_HEADER	KEY_URL	= $KEY_URL"
echo "$LOG_HEADER	RECV_KEYS	= $RECV_KEYS"
echo "$LOG_HEADER	RVM_URL	= $RVM_URL"
echo "$LOG_HEADER	RVM_VER	= $RVM_VER"
echo "$LOG_HEADER	RUBY_VER	= $RUBY_VER"
echo "$LOG_HEADER	WORK_DIR	= $WORK_DIR"


## Prepare work directory

if [ ! -e $WORK_DIR ]; then
	mkdir $WORK_DIR
fi

cd $WORK_DIR


## Install RVM

if [ -e $RVM_SH ]; then
	source $RVM_SH
	rvm version | grep $RVM_VER
	
	if [ $? -eq 0 ]; then
		RVM_INSTALL=0
	fi
fi

if [ $RVM_INSTALL -eq 1 ]; then
	gpg2 --keyserver $KEY_URL --recv-keys $RECV_KEYS
	curl -sSL $RVM_URL | bash -s stable --version $RVM_VER
	source $RVM_SH
else
	echo "$LOG_HEADER	rvm ver$RVM_VER has already been installed."
fi


## Install Ruby

rvm list | grep $RUBY_VER

if [ $? -eq 0 ]; then
	RUBY_INSTALL=0
	echo "$LOG_HEADER	ruby ver$RUBY_VER has already been installed."
fi

if [ $RUBY_INSTALL -eq 1 ]; then
	rvm install $RUBY_VER
fi

rvm default $RUBY_SET
