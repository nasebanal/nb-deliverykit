#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Create osdk_admin group

group 'osdk_admin' do
	group_name	'osdk_admin'
	gid	200
	action	:create
end

## Create osdk_admin user

user 'osdk_admin' do
	uid	200
	group	'osdk_admin'
	home	'/home/osdk_admin'
	shell	'/bin/bash'
	password	'osdk_admin'
	action	:create
end
