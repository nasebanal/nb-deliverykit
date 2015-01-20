#
# Cookbook Name:: openjdk
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Install JDK

package "java-1.7.0-openjdk-devel" do
	action :upgrade
end
