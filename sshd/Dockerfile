FROM centos:6
RUN yum install -y openssh-server
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN echo "root:123123"|chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]