#!/bin/bash

#================================================================
# FILE:	init_db.sh
# VERSION:	1.0
# AUTHOR:	S.Yatsuzuka
#
# Copyright(c) 2015 NASEBANAL All Rights Reserved.
#================================================================


## Check the argument

if [ $# -ne 3 ] ; then
	echo "usage: $0 <Password> <Drop SQL> <Create SQL>"
	echo
	exit 1
fi


## Set Variables

PASSWORD=$1
DROP_SQL=$2
CREATE_SQL=$3

LOG_HEADER="MESSAGE:"


echo "$LOG_HEADER	PASSWORD	= $PASSWORD"
echo "$LOG_HEADER	DROP_SQL	= $DROP_SQL"
echo "$LOG_HEADER	CREATE_SQL	= $CREATE_SQL"


## Initialize Database

mysqladmin -u root password 'osdk_admin'
mysql -uroot -p$PASSWORD < $DROP_SQL
mysql -uroot -p$PASSWORD < $CREATE_SQL
