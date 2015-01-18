#
# Cookbook Name:: redmine
# Recipe:: default
#
# Copyright 2015, REDMINE
#
# All rights reserved - Do Not Redistribute
#

## Ceate work directory

directory node['redmine']['working_dir'] do
	action :create
end


## Install Redmine

bash 'install redmine' do
	action :nothing
	cwd node['redmine']['working_dir']
	code <<-EOH
tar xzvf #{node['redmine']['arch_file']}
mv #{node['redmine']['dir_name']} #{node['redmine']['install_dir']}
ln -s #{node['redmine']['install_dir']} #{node['redmine']['target_dir']}
EOH
end


## Download tarball

remote_file ::File.join(node['redmine']['working_dir'], node['redmine']['arch_file']) do
    source node['redmine']['site_url'] + node['redmine']['arch_file']
    notifies :run, 'bash[install redmine]', :immediately
end


## Copy database.yml

template "#{node['redmine']['db_yml_path']}" do
	source "#{node['redmine']['db_yml']}"
	mode "0644"
end


## Install Ruby gems

bash 'install gems' do
    action :run
    cwd node['redmine']['target_dir']
    code <<-EOH
bundle install
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
gem install passenger --no-rdoc --no-ri
EOH
end
