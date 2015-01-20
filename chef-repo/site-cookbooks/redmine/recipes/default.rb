#
# Cookbook Name:: redmine
# Recipe:: default
#
# Copyright 2015, REDMINE
#
# All rights reserved - Do Not Redistribute
#


## Install Image Magick

package "ImageMagick" do
	action :upgrade
	version "6.5.4.7"
end


## Install Image Magick devel

package "ImageMagick-devel" do
	action :upgrade
	version "6.5.4.7"
end


## Install ipa pgothic fonts

package "ipa-pgothic-fonts" do
	action :upgrade
	version "003.02"
end


## Install libcurl

package 'libcurl-devel' do
    action :upgrade
    version "7.19.7"
end


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
chown -R osdk_admin:osdk_admin #{node['redmine']['install_dir']}
chmod -R 777 #{node['redmine']['install_dir']}
EOH
end


## Link to redmine directory

link node['redmine']['target_dir'] do
	to node['redmine']['install_dir']
end


## Download tarball

remote_file ::File.join(node['redmine']['working_dir'], node['redmine']['arch_file']) do
    source node['redmine']['site_url'] + node['redmine']['arch_file']
    notifies :run, 'bash[install redmine]', :immediately
end


## Copy database.yml

template node['redmine']['db_yml_path'] do
	source node['redmine']['db_yml']
	mode "0644"
end


## Copy passenger parameter file

template node['redmine']['passenger_params_path'] do
	source node['redmine']['passenger_params']
	mode "0644"
end


## Install Ruby gems

bash 'install gems' do
	user 'osdk_admin'
    action :run
    cwd node['redmine']['target_dir']
    code <<-EOH
source /etc/profile.d/rvm.sh
bundle install
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
gem install passenger --no-rdoc --no-ri -v 4.0.57
passenger-install-apache2-module < #{node['redmine']['passenger_params_path']}
EOH
end


## Link redmine

link "/var/www/html/redmine" do
	to "/opt/redmine/public"
end


## Copy passenger.conf

template node['redmine']['passenger_conf_path'] do
	source node['redmine']['passenger_conf']
	mode "0666"
end


## Reboot httpd

service "httpd" do
	action [ :reload ]
end
