FROM ubuntu
MAINTAINER malei

# 更新源，安装ssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh
RUN  /usr/bin/ssh-keygen -A
# 设置root ssh远程登录密码为123456
RUN echo "root:123123" | chpasswd

RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN sed -i 's/^PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# 取消PAM限制
RUN sed -i '/pam_loginuid.so/c session    optional     pam_loginuid.so'  /etc/pam.d/sshd

# 添加orache java7源，一次性安装vim，wget，curl，java7，tomcat7等必备软件
# RUN apt-get install python-software-properties
# RUN add-apt-repository ppa:webupd8team/java
# RUN apt-get update
# RUN apt-get install -y vim wget curl oracle-java7-installer tomcat7
# 设置JAVA_HOME环境变量RUN update-alternatives --display java
# RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle">> /etc/environment
# RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle">> /etc/default/tomcat7
# 容器需要开放SSH 22端口
EXPOSE 22
# 容器需要开放Tomcat 8080端口
# EXPOSE 8080
# 设置Tomcat7初始化运行，SSH终端服务器作为后台运行
# ENTRYPOINT service tomcat7 start && /usr/sbin/sshd -D
ENTRYPOINT  /usr/sbin/sshd -D