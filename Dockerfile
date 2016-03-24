# centos7 with some basic tools

FROM daocloud.io/centos:7.2.1511

###### EPEL repository
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

###### install basic tools
RUN yum -y install \
	sudo \
	wget \
	perl \
	ack \
	which \
	net-tools.x86_64 \
	glibc.i686 \
	xdg-utils

###### ssh server and client
RUN yum -y install openssh-server.x86_64 openssh-clients.x86_64  && \
	ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" && \
	ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" && \
	ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""

###### add user devuser
RUN ( printf 'devuser\ndevuser\n' | passwd ) && \
	useradd devuser && \
	( printf 'devuser\ndevuser\n' | passwd devuser ) && \
	( echo 'devuser    ALL=(ALL)       NOPASSWD:ALL' > /etc/sudoers.d/devuser ) && \
	sed 's/^Defaults \{1,\}requiretty'//g -i /etc/sudoers

###### set LANG
RUN echo 'export LANG=en_US.utf8' > /etc/profile.d/lang.sh

EXPOSE 22
USER devuser
ENV DEV_HOME /home/devuser
CMD /usr/sbin/sshd -D

