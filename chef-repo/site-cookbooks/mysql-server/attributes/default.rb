default['mysql']['root_password'] = 'osdk_admin'
default['mysql']['init_sql'] = 'init_db.sql'

default['mysql']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'mysql')
default['mysql']['init_sql_path'] = ::File.join(node['mysql']['working_dir'], node['mysql']['init_sql'])
