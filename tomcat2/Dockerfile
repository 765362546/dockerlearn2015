FROM daocloud.io/maleilearn/ssh:master-init
MAINTAINER maleilearn
ENV CATALINA_HOME /opt/tomcat

# INSTALL JAVA_HOME
RUN yum install -y wget tar java-1.6.0-openjdk

# INSTALL TOMCAT
RUN  cd /opt/ && \
wget http://125.39.35.143/files/2073000007B47C74/mirrors.hust.edu.cn/apache/tomcat/tomcat-6/v6.0.45/bin/apache-tomcat-6.0.45.tar.gz && \
tar -vxf apache-tomcat-*.gz && \
rm -rf *.gz && \
mv apache-tomcat-* tomcat

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 22 8080
CMD ["/run.sh"]
