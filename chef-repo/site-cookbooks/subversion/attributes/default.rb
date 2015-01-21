## for directory

default['subversion']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'subversion')
