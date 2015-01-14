## repository
default['maven']['site_url'] = 'http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.2.5/binaries/'
default['maven']['arch_file'] = 'apache-maven-3.2.5-bin.tar.gz'
default['maven']['dir_name'] = 'apache-maven-3.2.5'

## for directory path
default['maven']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'maven')
default['maven']['install_dir'] = '/opt/apache-maven-3.2.5'
default['maven']['target_dir'] = '/opt/maven'
