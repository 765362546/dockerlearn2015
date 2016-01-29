FROM centos:6
RUN yum install -y openssh-server passwd
RUN echo "123123"|passwd --stdin root
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]