#
# Cookbook Name:: phpldapadmin
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Install phpldapadmin

package "phpldapadmin" do
	action :upgrade
	version "1.2.3"
end


## Copy apache conf file

template "/etc/httpd/conf.d/phpldapadmin.conf" do
	source "phpldapadmin.conf"
end


## Copy conf file

template "/etc/phpldapadmin/config.php" do
	owner 'apache'
	group 'apache'
	mode '0755'
	source "config.php"
end


## Restart Apacher server

service "httpd" do
	action :reload
end
