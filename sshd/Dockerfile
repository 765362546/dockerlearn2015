FROM centos:6
RUN yum install -y openssh-server passwd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN echo "123123"|passwd --stdin root
EXPOSE 22
CMD ["/usr/bin/sshd","-D"]