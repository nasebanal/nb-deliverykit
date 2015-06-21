#
# Cookbook Name:: start
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Start sshd

service "sshd" do
	action :start
end


## Start slapd

service "slapd" do
	action :start
end


## Start httpd

service "httpd" do
	action :start
end


## Start mysql-server

service "mysqld" do
	action :start
end


## Start subversion

service "svnserve" do
	action :start
end


## Start jenkins

service "jenkins" do
	action :start
end
