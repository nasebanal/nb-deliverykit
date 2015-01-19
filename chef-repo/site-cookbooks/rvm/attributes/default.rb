## Repository

default['rvm']['site_url'] = 'https://get.rvm.io'
default['rvm']['key_url'] = 'hkp://keys.gnupg.net'
default['rvm']['recv_keys'] = '409B6B1796C275462A1703113804BB82D39DC0E3'

## Directory

default['rvm']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'rvm')


## File

default['rvm']['install_sh'] = 'install_ruby.sh'
default['rvm']['install_sh_path'] = ::File.join(node['rvm']['working_dir'], node['rvm']['install_sh'])

