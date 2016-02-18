FROM centos:7.2.1511

RUN useradd devuser
RUN printf 'devuser\ndevuser\n' | passwd devuser

RUN yum -y install wget

RUN yum -y install gcc
RUN yum -y install gcc-c++

RUN yum -y install java-1.8.0-openjdk.x86_64

RUN yum -y install gtk2

CMD /bin/bash

