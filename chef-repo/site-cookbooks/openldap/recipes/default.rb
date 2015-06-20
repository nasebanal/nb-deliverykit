#
# Cookbook Name:: openldap
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Install openldap-server

package "openldap-servers" do
	action :upgrade
	version "2.4.39"
end


## Install openldap-clients

package "openldap-clients" do
	action :upgrade
	version "2.4.39"
end


## Start slapd

service "slapd" do
	action  [ :enable, :start ]
end
