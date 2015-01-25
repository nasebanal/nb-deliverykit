## for directory path
default['httpd']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'httpd')
default['httpd']['htdocs_dir'] = '/var/www/html'

