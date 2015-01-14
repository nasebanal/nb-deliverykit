#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Set root password

user 'root' do
	password '$1$KP8L6vGg$OaBeP50WUuquHZzLGV41l0'
	action :manage
end

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
	password	'$1$Esa8qk9P$g5FdY67z4YwgHQ5GfY8t/1'
	action	:create
end

## Create bash profile

template '/home/osdk_admin/.bash_profile' do
	source '.bash_profile.erb'
	mode '0644'
end
