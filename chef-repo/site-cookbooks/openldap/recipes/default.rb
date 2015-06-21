#
# Cookbook Name:: openldap
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Create working directory

remote_directory node['openldap']['working_dir'] do
	source 'openldap'
end


## Install openldap-server

package "openldap-servers" do
	action :upgrade
	version "2.4.39"
end


## Install openldap-clients

package "openldap-clients" do
	action :upgrade
	version "2.4.39"
end


## Remove initial config files

bash 'remove initial files' do
	action :run
	code <<-EOH
rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
EOH
end


## Create DB_CONFIG

template "/var/lib/ldap/DB_CONFIG" do
	owner 'ldap'
	group 'ldap'
	source "DB_CONFIG"
	action :create
end


## Create slapd.conf

template "/etc/openldap/slapd.conf" do
	owner 'ldap'
	group 'ldap'
	source "slapd.conf"
	action :create
end


## Update slapd.d

bash 'update slapd.d' do
	user 'ldap'
	action :run
	code <<-EOH
slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d
echo
EOH
end


## Start slapd

service "slapd" do
	action  [ :enable, :start ]
end


## Add initial entries

bash 'add init entries' do
	cwd node['openldap']['working_dir']
	action :run
	code <<-EOH
ldapadd -x -D "cn=Manager,dc=my-domain,dc=com" -w osdk_admin -f init.ldif
ldapadd -x -D "cn=Manager,dc=my-domain,dc=com" -w osdk_admin -f people.ldif
ldapsearch -x -b 'dc=my-domain,dc=com' '(objectclass=*)'
EOH
end
