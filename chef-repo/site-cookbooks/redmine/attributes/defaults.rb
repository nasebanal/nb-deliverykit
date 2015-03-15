## repository
default['redmine']['site_url'] = 'http://www.redmine.org/releases/'
default['redmine']['arch_file'] = 'redmine-2.5.0.tar.gz'
default['redmine']['dir_name'] = 'redmine-2.5.0'

## for directory path
default['redmine']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'redmine')
default['redmine']['install_dir'] = '/opt/redmine-2.5.0'
default['redmine']['target_dir'] = '/opt/redmine'
default['redmine']['config_dir'] = ::File.join(node['redmine']['install_dir'],'config')
default['redmine']['plugin_dir'] = ::File.join(node['redmine']['install_dir'],'plugins')
default['redmine']['httpdconf_dir'] = '/etc/httpd/conf.d'

## for file path
default['redmine']['db_yml'] = 'database.yml'
default['redmine']['db_yml_path'] = ::File.join(node['redmine']['config_dir'],node['redmine']['db_yml'])
default['redmine']['passenger_params'] = 'parameters.txt'
default['redmine']['passenger_params_path'] = ::File.join(node['redmine']['working_dir'], node['redmine']['passenger_params'])
default['redmine']['passenger_conf'] = 'passenger.conf'
default['redmine']['passenger_conf_path'] = ::File.join(node['redmine']['httpdconf_dir'], node['redmine']['passenger_conf'])
default['redmine']['init_redmine'] = 'init_redmine.sql'
default['redmine']['init_redmine_path'] = ::File.join(node['redmine']['working_dir'], node['redmine']['init_redmine'])
default['redmine']['init_redmine_2'] = 'init_redmine_2.sql'
default['redmine']['init_redmine_2_path'] = ::File.join(node['redmine']['working_dir'], node['redmine']['init_redmine_2'])
default['redmine']['install_passenger'] = 'install_passenger.sh'
default['redmine']['install_passenger_path'] = ::File.join(node['redmine']['working_dir'], node['redmine']['install_passenger'])
