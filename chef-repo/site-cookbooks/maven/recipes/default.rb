#
# Cookbook Name:: maven
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Create work directory

directory node['maven']['working_dir'] do
	action :create
end


## Install Maven

bash 'install maven' do
	action :nothing
	cwd node['maven']['working_dir']
	code <<-EOH
tar xzvf #{node['maven']['arch_file']}
mv #{node['maven']['dir_name']} #{node['maven']['install_dir']}
ln -s #{node['maven']['install_dir']} #{node['maven']['target_dir']}
EOH
end


## Download tarball

remote_file ::File.join(node['maven']['working_dir'], node['maven']['arch_file']) do
	source node['maven']['site_url'] + node['maven']['arch_file']
	notifies :run, 'bash[install maven]', :immediately
end
