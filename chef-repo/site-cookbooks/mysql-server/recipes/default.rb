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


## Copy init_db.sh

template node['mysql']['init_sh_path'] do
        source node['mysql']['init_sh']
        mode "0755"
end


## Copy drop_db.sql

template node['mysql']['drop_sql_path'] do
	source node['mysql']['drop_sql']
	mode "0644"
end


## Copy create_db.sql

template node['mysql']['create_sql_path'] do
    source node['mysql']['create_sql']
    mode "0644"
end


## Start service

service "mysqld" do
	action [ :enable, :start ]
end


## Initialize Database

bash "init db" do
	action :run
	code <<-EOH
#{node['mysql']['init_sh_path']} #{node['mysql']['root_password']} #{node['mysql']['drop_sql_path']} #{node['mysql']['create_sql_path']}
EOH
end
