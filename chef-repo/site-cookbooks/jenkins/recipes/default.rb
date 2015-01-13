#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Add repository

remote_file node['jenkins']['repo'] do
	source node['jenkins']['repo_url']
end

bash 'import jenkins repo' do
	code <<-EOH
rpm --import #{node['jenkins']['key_url']}
EOH
end

package "jenkins" do
	action :upgrade
	version "1.596"
end
