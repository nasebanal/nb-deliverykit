#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
	action :upgrade
	version "2.2.15"
end

package "httpd-devel" do
	action :upgrade
	version "2.2.15"
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	mode "0644"
end

service "httpd" do
	action :start
end
