#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Install httpd

package "httpd" do
	action :upgrade
	version "2.2.15"
end


## Install httpd-devel

package "httpd-devel" do
	action :upgrade
	version "2.2.15"
end


## Copy httpd.conf

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	mode "0644"
end


## Start httpd

service "httpd" do
	action [ :enable, :start ]
end
