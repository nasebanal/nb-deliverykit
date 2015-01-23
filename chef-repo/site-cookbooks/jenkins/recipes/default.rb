#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Add repository

yum_repository 'jenkins.repo' do
	baseurl node['jenkins']['repo_url']
	gpgkey node['jenkins']['key_url']
	action :create
end


## Install Jenkins

package "jenkins" do
	action :upgrade
	version "1.596"
end


## Copy sysconfig

template node['jenkins']['sysconfig_path'] do
	source node['jenkins']['sysconfig']
	mode '0666'
end


## Start Jenkins

service 'jenkins' do
	action [ :enable, :start ]
end


## Copy jenkins.conf

template node['jenkins']['jenkins_conf_path'] do
    source node['jenkins']['jenkins_conf']
    mode '0666'
end


## Reload httpd.conf

service 'httpd' do
	action :reload
end
