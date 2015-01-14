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
curl -sSL #{node['rvm']['site_url']} | bash -s stable
EOH
end
