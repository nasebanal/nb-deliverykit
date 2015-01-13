FROM centos:6.6

ENV CHEF_HOME /var/chef-repo
ADD chef-repo /var/chef-repo

RUN curl -L http://www.opscode.com/chef/install.sh | bash
RUN cd ${CHEF_HOME} && chef-solo -c ${CHEF_HOME}/solo.rb -j ${CHEF_HOME}/nodes/docker.json
