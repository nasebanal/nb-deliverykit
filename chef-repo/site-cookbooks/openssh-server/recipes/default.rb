#
# Cookbook Name:: openssh-server
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

package "openssh-server" do
	action :upgrade
	version "5.3"
end

package "openssh-clients" do
	action :upgrade
	version "5.3"
end

service "sshd" do
	action :start
end
