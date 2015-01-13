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
