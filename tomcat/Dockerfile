#jdk+tomcat
#/opt/jdk
#/opt/tomcat
FROM centos:6
ENV JAVA_HOME /opt/jak
ENV CATALINA_HOME /opt/tomcat

VOLUME data /volume

# INSTALL JAVA_HOME
RUN cp /volume/software/jdk-6u21-linux-x64.bin /opt/ && cd /opt/ && chmod +x *.bin && ./jdk*.bin &> /dev/null && rm -rf *.bin && mv jdk* jdk

# INSTALL TOMCAT
RUN cp /volume/software/apache-tomcat-6.0.29.tar.gz /opt/ && cd /opt/ && tar -vxf apache-tomcat-*.gz && rm -rf *.gz && mv apache-tomcat-* tomcat

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 8080
CMD ["/run.sh"]