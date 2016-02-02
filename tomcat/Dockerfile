#jdk+tomcat
#/opt/jdk
#/opt/tomcat
FROM centos:6

RUN yum install -y wget tar
ENV JAVA_HOME /opt/jdk
ENV CATALINA_HOME /opt/tomcat


# INSTALL JAVA_HOME
RUN  cd /opt/ && \
wget -c -O jdk-6u21-linux-x64.bin "http://92fdd04a-b80f-4e51-61cb-fca5a00c490f.daoapp.io/index.php?share/fileDownload&user=admin&sid=BkhgjAwN" && \
chmod +x *.bin && \
yes|./jdk*.bin && \
rm -rf *.bin && \
mv jdk* jdk

# INSTALL TOMCAT
RUN  cd /opt/ && \
wget -c -O apache-tomcat-6.0.29.tar.gz "http://92fdd04a-b80f-4e51-61cb-fca5a00c490f.daoapp.io/index.php?share/fileDownload&user=admin&sid=BbSleXUx" && \
tar -vxf apache-tomcat-*.gz && \
rm -rf *.gz && \
mv apache-tomcat-* tomcat

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 8080
CMD ["/run.sh"]