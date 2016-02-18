FROM centos:7.2.1511

###### add user devuser
RUN useradd devuser
RUN printf 'devuser\ndevuser\n' | passwd devuser


###### install basic tools
RUN yum -y install wget
RUN yum -y install gtk2

###### gnu c c++
RUN yum -y install gcc
RUN yum -y install gcc-c++

###### jdk 1.8
RUN yum -y install java-1.8.0-openjdk-devel.x86_64

CMD /bin/bash

