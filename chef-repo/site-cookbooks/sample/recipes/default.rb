#
# Cookbook Name:: sample
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Create work directory

directory node['sample']['working_dir'] do
	action :create
end

## Copy init redmine sql

template node['sample']['init_redmine_path'] do
	source node['sample']['init_redmine']
	mode '0666'
end


## Deploy html files

remote_directory node['sample']['home_dir'] do
	source 'html'
	files_owner 'apache'
	files_group 'apache'
	owner 'apache'
	group 'apache'
	mode '0777'
end


## Replace method.html

bash 'replace method.html' do
	cwd node['sample']['htdocs_dir']
	code <<-EOH
rm method.html
ln -s sample/method.html method.html
EOH
end


## Import redmine data

bash 'import redmine' do
	action :run
	cwd node['sample']['working_dir']
	code <<-EOH
mysql -uroot --password='osdk_admin' < #{node['sample']['init_redmine_path']}
EOH
end


## Reboot httpd

service "httpd" do
	action [ :restart ]
end
