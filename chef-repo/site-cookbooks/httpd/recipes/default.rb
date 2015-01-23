#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Create work directory

directory node['httpd']['working_dir'] do
	action :create
end


## Install httpd

package "httpd" do
	action :upgrade
	version "2.2.15"
end


## Install httpd-devel

package "httpd-devel" do
	action :upgrade
	version "2.2.15"
end


## Copy httpd.conf

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	mode "0644"
end


## Copy htdocs tar

template node['httpd']['html_tar_path'] do
	source node['httpd']['html_tar']
	mode '0666'
end


## Deploy html files

bash 'deploy htdocs' do
	action :run
	cwd node['httpd']['working_dir']
	code <<-EOH
tar xzvf #{node['httpd']['html_tar']}
cp -rf html/* #{node['httpd']['htdocs_dir']}
EOH
end


## Start httpd

service "httpd" do
	action [ :enable, :start ]
end
