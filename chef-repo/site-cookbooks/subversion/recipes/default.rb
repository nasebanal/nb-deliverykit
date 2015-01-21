#
# Cookbook Name:: subversion
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Create work directory 

directory node['subversion']['working_dir'] do
	action :create
end


## Install subversion

package "subversion" do
	action :upgrade
	version "1.6.11"
end


## Install mod_dav_svn" do

package "mod_dav_svn" do
	action :upgrade
	version "1.6.11"
end


## Copy subversion.conf

template "/etc/httpd/conf.d/subversion.conf" do
	source "subversion.conf"
	mode "0666"
end


## Create svn directory

directory "/var/www/svn" do
	owner "apache"
	group "apache"
	mode "0777"
end


## Create repository

bash "create repository" do
	action :run
	cwd node['subversion']['working_dir']
	code <<-EOH
svnadmin create /var/www/svn/sample
chown -R apache:apache /var/www/svn/sample
EOH
end


## Start svnserve

service "svnserve" do
	action [ :enable, :start ]
end


## Reload httpd conf

service "httpd" do
	action :reload
end
