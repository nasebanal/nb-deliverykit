## for directory path
default['sample']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'sample')
default['sample']['htdocs_dir'] = '/var/www/html'
default['sample']['home_dir'] = ::File.join(node['sample']['htdocs_dir'], 'sample')


## for file path
default['sample']['init_redmine'] = 'init_redmine.sql'
default['sample']['init_redmine_path'] = ::File.join(node['sample']['working_dir'], node['sample']['init_redmine'])
