Open Source Delivery Kit

[Component]
-Cent OS 6.6
-yum 3.5.2
-which 2.19
-tar 1.23
-ImageMagick 6.5.4.7
-OpenJDK 1.7.0
-RVM 1.26.9
-Ruby 2.1.3
-Berkshelf 3.2.3
-OpenSSH Server (sshd) 5.3
-Apache Web Server (httpd / httpd-devel) 2.2.15
-MySQL Server (mysql-server / mysql-devel) 5.1.73
-Subversion 1.6.11
-Maven 1.25
-Redmine 2.5.0
-Jenkins 1.596

[Prerequisite]
-Install Docker

[How to Use]

Step.1) Download docker image for centos 6.6.

 $ sudo docker pull centos:6.6

 (reference)
 https://registry.hub.docker.com/_/centos/

Step.2) Download Dockerfile and Chef recipe.

Step.3) Create docker image.

 $ sudo docker build -t \<Docker Image Nam\> .

Step.4) Launch docker image.

 $ sudo docker run -it --name \<Docker Container Name\> \<Docker Image Name\> /bin/bash

Step.5) Start services.

 # cd /var/chef-repo
 # chef-solo -c solo.js -j node/start.js

(If you want to restart services, execute the following command.)

 # chef-solo -c solo.js -j node/restart.js

Step.6) Apply additional package for methodology.

(Sample Methodology Pack)
https://github.com/nasebanal/nb-methodology
