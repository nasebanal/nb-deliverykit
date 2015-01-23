## for directory path
default['httpd']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'httpd')
default['httpd']['htdocs_dir'] = '/var/www/html'


## for file path
default['httpd']['html_tar'] = 'html.tar.gz'
default['httpd']['html_tar_path'] = ::File.join(node['httpd']['working_dir'], node['httpd']['html_tar'])
