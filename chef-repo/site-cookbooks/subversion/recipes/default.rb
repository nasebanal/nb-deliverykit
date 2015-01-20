#
# Cookbook Name:: subversion
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Install subversion

package "subversion" do
	action :upgrade
	version "1.6.11"
end


## Start svnserve

service "svnserve" do
	action [ :enable, :start ]
end
