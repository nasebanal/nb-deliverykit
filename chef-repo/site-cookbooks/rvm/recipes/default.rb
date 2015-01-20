#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Create work directory

directory node['rvm']['working_dir'] do
	action :create
end


## Copy install_ruby.sh

template node['rvm']['install_sh_path'] do
	source node['rvm']['install_sh']
	mode "0755"
end


## Install RVM

bash 'install rvm' do
    action :run
    cwd node['rvm']['working_dir']
    code <<-EOH
#{node['rvm']['install_sh_path']} #{node['rvm']['key_url']} #{node['rvm']['recv_keys']} #{node['rvm']['site_url']} 1.26.9 2.1.3 #{node['rvm']['working_dir']}
EOH
end

# Add osdk_admin to rvm group

group "rvm" do
	action :modify
	members "osdk_admin"
	append true
end

## Install bundler

bash 'install bundler' do
	user 'osdk_admin'
	action :run
	cwd node['rvm']['working_dir']
	code <<-EOH
source /etc/profile.d/rvm.sh
gem install bundler -v 1.7.12
EOH
end
