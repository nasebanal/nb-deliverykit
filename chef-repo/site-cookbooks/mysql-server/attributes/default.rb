## Directory

default['mysql']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'mysql')


## File

default['mysql']['drop_sql'] = 'drop_db.sql'
default['mysql']['drop_sql_path'] = ::File.join(node['mysql']['working_dir'], node['mysql']['drop_sql'])
default['mysql']['create_sql'] = 'create_db.sql'
default['mysql']['create_sql_path'] = ::File.join(node['mysql']['working_dir'], node['mysql']['create_sql'])
default['mysql']['init_sh'] = 'init_db.sh'
default['mysql']['init_sh_path'] = ::File.join(node['mysql']['working_dir'], node['mysql']['init_sh'])


## Variable

default['mysql']['root_password'] = 'osdk_admin'
