## repository
default['maven']['site_url'] = 'http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.2.5/source/'
default['maven']['arch_file'] = 'apache-maven-3.2.5-src.tar.gz'

## for tempolary working
default['maven']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'maven')
