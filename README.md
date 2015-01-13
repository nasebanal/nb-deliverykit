Open Source Delivery Kit

[Component]
-Cent OS 6.6
-tar 1.23
-OpenJDK 1.7.0
-Maven 1.25

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
