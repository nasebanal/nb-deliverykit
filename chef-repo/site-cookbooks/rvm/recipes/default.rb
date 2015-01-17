#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Install RVM

bash 'install rvm' do
    action :run
    cwd node['rvm']['working_dir']
    code <<-EOH
gpg2 --keyserver #{node['rvm']['key_url']} --recv-keys #{node['rvm']['recv_keys']}
curl -sSL #{node['rvm']['site_url']} | bash -s stable --version 1.26.9
source /etc/profile.d/rvm.sh
rvm install 2.1.3
EOH
end

# Add osdk_admin to rvm group

group "rvm" do
	action :modify
	members "osdk_admin"
	append true
end

## Install bundler

gem_package 'bundler' do
    action :upgrade
    version "1.7.12"
end
