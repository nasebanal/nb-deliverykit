#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Append epel for repository list

yum_repository 'epel' do
	mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
	fastestmirror_enabled true
	gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
	action :create
end


## Install tar

package "tar" do
	action :upgrade
	version "1.23"
end


## Install which

package "which" do
	action :upgrade
	version "2.19"
end
