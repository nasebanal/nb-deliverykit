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
	action :restart
end


## Start slapd

service "slapd" do
	action :restart
end


## Start httpd

service "httpd" do
	action :restart
end


## Start mysql-server

service "mysqld" do
	action :restart
end


## Start subversion

service "svnserve" do
	action :restart
end


## Start jenkins

service "jenkins" do
	action :restart
end
