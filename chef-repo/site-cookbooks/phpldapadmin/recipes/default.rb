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


