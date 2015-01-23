## repository
default['jenkins']['repo_url'] = 'http://pkg.jenkins-ci.org/redhat'
default['jenkins']['key_url'] = 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'

## for directory
default['jenkins']['http_conf_dir'] = '/etc/httpd/conf.d';
default['jenkins']['sysconfig_dir'] = '/etc/sysconfig';

## for file
default['jenkins']['jenkins_conf'] = 'jenkins.conf'
default['jenkins']['jenkins_conf_path'] = ::File.join(node['jenkins']['http_conf_dir'], node['jenkins']['jenkins_conf'])
default['jenkins']['sysconfig'] = 'jenkins'
default['jenkins']['sysconfig_path'] = ::File.join(node['jenkins']['sysconfig_dir'], node['jenkins']['sysconfig'])
