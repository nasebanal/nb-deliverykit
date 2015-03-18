#
# Cookbook Name:: scrum
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Create work directory

directory node['scrum']['working_dir'] do
	action :create
end

## Copy init redmine sql

template node['scrum']['init_redmine_path'] do
	source node['scrum']['init_redmine']
	mode '0666'
end


## Deploy html files

remote_directory node['scrum']['home_dir'] do
	source 'html'
	files_owner 'apache'
	files_group 'apache'
	owner 'apache'
	group 'apache'
	mode '0777'
end


## Replace method.html

bash 'replace method.html' do
	cwd node['scrum']['htdocs_dir']
	code <<-EOH
rm method.html
ln -s scrum/method.html method.html
EOH
end


## Import redmine data

bash 'import redmine' do
	action :run
	cwd node['scrum']['working_dir']
	code <<-EOH
mysql -uroot --password='osdk_admin' < #{node['scrum']['init_redmine_path']}
EOH
end


## Reboot httpd

service "httpd" do
	action [ :restart ]
end
