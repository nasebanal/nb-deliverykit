# NASEBANAL Open Source Delivery Kit

This is Chef Recipe to create a Docker Image for nb-deliverykit.
You can down load it from https://hub.docker.com/r/syatsuzuka/nb-deliverykit/

[Component]

* Cent OS 6.6
* yum 3.5.2
* which 2.19
* tar 1.23
* sudo 1.8.6
* ImageMagick 6.5.4.7
* OpenJDK 1.7.0
* RVM 1.26.9
* Ruby 2.1.3
* OpenSSH Server (sshd) 5.3
* OpenLDAP Server (slap) 2.4.39
* OpenLDAP Clients 2.4.39
* PHP LDAP Admin 1.2.3
* Apache Web Server (httpd / httpd-devel) 2.2.15
* MySQL Server (mysql-server / mysql-devel) 5.1.73
* Subversion 1.6.11
* Maven 1.25
* Redmine 2.5.0
* Jenkins 1.596


[Prerequisite]
* Install Docker


[How to Use]

Step.1) Prepare work directory.

	$ mkdir <Work Directory>

Step.2) Get Recipe.

	$ cd <Work Directory>
	$ git clone https://github.com/nasebanal/nb-deliverykit.git

Step.3) Prepare Bae Docker Image

	$ sudo docker pull centos:6.6

(reference)
 https://registry.hub.docker.com/_/centos/


Step.4) Create Docker Image

	$ cd nb-deliverykit
	$ sudo docker build -t <Docker Image Name> .

Step.5) Launch docker image.

    $ sudo docker run -p 0.0.0.0:80:80 --priviledged -it --name \<Docker Container Name\> \<Docker Image Name\> /bin/bash


Step.6) Start services.

    # cd /var/chef-repo
    # chef-solo -c solo.js -j node/start.js

(If you want to restart services, execute the following command.)

    # chef-solo -c solo.js -j node/restart.js

Step.6) Apply sample package for methodology.

	# chef-solo -c solo.js -j node/sample.js

Step.7) Access to http://<IP Address>/
	

[Initial Password]

* OS ROOT User: root / root
* LDAP ROOT User: cn=Manager,dc=my-domain,dc=com / osdk_admin
* mySQL Admin User: root / osdk_admin
* Redmine Admin User: admin / admin
