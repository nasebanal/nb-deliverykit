FROM centos:6.6

## Prepare Chef Repository 
ENV CHEF_HOME /var/chef-repo
ADD chef-repo /var/chef-repo
ADD issues /var/issues
ADD repo /var/repo

## Install Chef Solo
RUN curl -L http://www.opscode.com/chef/install.sh | bash

## Execute Chef Solo 
RUN cd ${CHEF_HOME} && chef-solo -c ${CHEF_HOME}/solo.rb -j ${CHEF_HOME}/nodes/docker.json
