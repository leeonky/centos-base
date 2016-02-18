FROM centos:7.2.1511

RUN useradd devuser
RUN printf 'devuser\ndevuser\n' | passwd devuser




CMD /bin/bash

