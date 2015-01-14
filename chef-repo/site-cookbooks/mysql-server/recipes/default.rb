#
# Cookbook Name:: mysql-server
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server" do
	action :upgrade
	version "5.1.73"
end

package "mysql-devel" do
	action :upgrade
	version "5.1.73"
end

template "/etc/my.cnf" do
	source "my.cnf.erb"
	mode "0644"
end

service "mysqld" do
	action :start
end
