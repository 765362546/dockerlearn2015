# This dockerfile uses the centos6.5 image
# VERSION 1
# Author: malei

FROM centos:7
MAINTAINER malei 

RUN yum install -y  --nogpgcheck firefox
RUN export uid=0 gid=0 
RUN mkdir -p /home/developer 
RUN echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash">>/etc/passwd 
RUN echo "developer:x:${uid}:">>/etc/group 
RUN echo "developer ALL=(ALL) NOPASSWD: ALL">>/etc/sudoers 
RUN chmod 0440 /etc/sudoers 
RUN chown ${uid}:${gid} -R /home/developer 
USER developer 
ENV HOME /home/developer 
CMD /usr/bin/firefox 
