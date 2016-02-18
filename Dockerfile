FROM centos:7.2.1511

RUN useradd devuser
RUN /bin/sh -c "printf 'devuser\ndenuser\n' | passwd devuser"




CMD /bin/bash

