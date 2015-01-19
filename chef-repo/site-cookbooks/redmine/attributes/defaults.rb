## repository
default['redmine']['site_url'] = 'http://www.redmine.org/releases/'
default['redmine']['arch_file'] = 'redmine-2.5.0.tar.gz'
default['redmine']['dir_name'] = 'redmine-2.5.0'

## for directory path
default['redmine']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'redmine')
default['redmine']['install_dir'] = '/opt/redmine-2.5.0'
default['redmine']['target_dir'] = '/opt/redmine'
default['redmine']['config_dir'] = ::File.join(node['redmine']['target_dir'],'config')

## for file path
default['redmine']['db_yml'] = 'database.yml'
default['redmine']['db_yml_path'] = ::File.join(node['redmine']['config_dir'],node['redmine']['db_yml'])
default['redmine']['passenger_params'] = 'passenger_params.txt'
default['redmine']['passenger_params_path'] = ::File.join(node['redmine']['working_dir'], node['redmine']['passenger_params'])
