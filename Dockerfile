FROM centos:7.2.1511

###### add user devuser
RUN ( printf 'devuser\ndevuser\n' | passwd ) && \
	useradd devuser && \
	( printf 'devuser\ndevuser\n' | passwd devuser )


###### install basic tools
RUN yum -y install wget && \
	yum -y install gtk2 && \
	yum -y install net-tools.x86_64 && \
	yum -y install openssh-server.x86_64 && \
	ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" && \
	ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" && \
	ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" && \
	yum -y install openssh-clients.x86_64

###### gnu c c++
RUN yum -y install gcc && \
	yum -y install gcc-c++

###### jdk 1.8
RUN yum -y install java-1.8.0-openjdk-devel.x86_64

##### service
RUN /usr/sbin/sshd

EXPOSE 22

CMD /bin/bash

