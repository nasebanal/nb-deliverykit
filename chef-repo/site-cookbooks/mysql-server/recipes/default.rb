#
# Cookbook Name:: mysql-server
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Create work directory

directory node['mysql']['working_dir'] do
	action :create
end


## Install mysql-server

package "mysql-server" do
	action :upgrade
	version "5.1.73"
end

## Install mysql-devel

package "mysql-devel" do
	action :upgrade
	version "5.1.73"
end

## Copy my.cnf

template "/etc/my.cnf" do
	source "my.cnf.erb"
	mode "0644"
end

## Copy init.sql

template "#{node['mysql']['init_sql_path']}" do
	source "#{node['mysql']['init_sql']}"
	mode "0644"
end

service "mysqld" do
	action :start
end

## 

bash "init db" do
	action :run
	code <<-EOH
mysqladmin -u root password '#{node['mysql']['root_password']}'
mysql -uroot -p#{node['mysql']['root_password']} < #{node['mysql']['init_sql_path']}
EOH
end
