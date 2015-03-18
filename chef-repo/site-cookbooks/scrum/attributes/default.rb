## for directory path
default['scrum']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'scrum')
default['scrum']['htdocs_dir'] = '/var/www/html'
default['scrum']['home_dir'] = ::File.join(node['scrum']['htdocs_dir'], 'scrum')


## for file path
default['scrum']['init_redmine'] = 'init_redmine.sql'
default['scrum']['init_redmine_path'] = ::File.join(node['scrum']['working_dir'], node['scrum']['init_redmine'])
