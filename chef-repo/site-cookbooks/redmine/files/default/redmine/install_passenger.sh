#!/bin/bash

#================================================================
# FILE:	install_passenger.sh
# VERSION:	1.0
# AUTHOR:	S.Yatsuzuka
#
# Copyright(c) 2015 NASEBANAL All Rights Reserved.
#================================================================


## Check the argument

if [ $# -ne 1 ] ; then
	echo "usage: $0 <Parameter File>"
	echo
	exit 1
fi


## Set Variables

PARAMETER_FILE=$1

LOG_HEADER="MESSAGE:"
INSTALL_FLAG="install_passenger.flag"


## Output Log

echo "$LOG_HEADER	PARAMETER_FILE	= $PARAMETER_FILE"
echo "$LOG_HEADER	INSTALL_FLAG	= $INSTALL_FLAG"


## Install Passenger

if [ ! -e $INSTALL_FLAG ]; then
	passenger-install-apache2-module < $PARAMETER_FILE
	touch $INSTALL_FLAG
fi

