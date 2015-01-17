## repository
default['redmine']['site_url'] = 'http://www.redmine.org/releases/'
default['redmine']['arch_file'] = 'redmine-2.5.0.tar.gz'
default['redmine']['dir_name'] = 'redmine-2.5.0'

## for directory path
default['redmine']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'maven')
default['redmine']['install_dir'] = '/opt/redmine-2.5.0'
default['redmine']['target_dir'] = '/opt/redmine'
