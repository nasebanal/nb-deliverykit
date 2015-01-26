#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Create work directory

directory node['httpd']['working_dir'] do
	action :create
end


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
	mode "0666"
end


## Copy htdocs tar

remote_directory node['httpd']['htdocs_dir'] do
	source 'html'
	files_owner 'apache'
	files_group 'apache'
	owner 'apache'
	group 'apache'
	mode '0777'
end


## Start httpd

service "httpd" do
	action [ :enable, :start ]
end
