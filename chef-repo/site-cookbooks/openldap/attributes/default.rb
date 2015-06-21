## for directory path
default['openldap']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'openldap')


## for file path
default['openldap']['init_ldif'] = 'init.ldif'
default['openldap']['init_ldif_path'] = ::File.join(node['openldap']['working_dir'], node['openldap']['init_ldif'])
