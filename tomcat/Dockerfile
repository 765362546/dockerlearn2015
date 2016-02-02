#jdk+tomcat
#/opt/jdk
#/opt/tomcat
FROM centos:6

RUN yum install -y wget tar
ENV JAVA_HOME /opt/jdk
ENV CATALINA_HOME /opt/tomcat


# INSTALL JAVA_HOME
RUN  cd /opt/ && \
#wget -c -O jdk-6u21-linux-x64.bin "http://92fdd04a-b80f-4e51-61cb-fca5a00c490f.daoapp.io/index.php?share/fileDownload&user=admin&sid=BkhgjAwN" 
wget -c -O jdk-6u21-linux-x64.bin "http://shcm01.baidupcs.com/file/c1ea0f6ea4de04bfb0d27f9b5d49c35a?bkt=p2-qd-294&fid=3090517915-250528-143907945793&time=1454169004&sign=FDTAXGERLBH-DCb740ccc5511e5e8fedcff06b081203-UZkDRBOvaneo1%2BvvDVAIFe1mxXI%3D&to=sh01hb&fm=Nan,B,U,mn&sta_dx=80&sta_cs=0&sta_ft=bin&sta_ct=7&fm2=Nanjing,B,U,mn&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=1400c1ea0f6ea4de04bfb0d27f9b5d49c35a8bf72f6f000004fff080&sl=76480590&expires=8h&rt=sh&r=852529060&mlogid=695624864327831407&vuk=3090517915&vbdid=1084850928&fin=jdk-6u21-linux-x64.bin&fn=jdk-6u21-linux-x64.bin&slt=pm&uta=0&rtype=1&iv=0&isw=0&dp-logid=695624864327831407&dp-callid=0.1.1" && \
chmod +x *.bin && \
yes|./jdk*.bin && \
rm -rf *.bin && \
mv jdk* jdk

# INSTALL TOMCAT
RUN  cd /opt/ && \
wget http://mirrors.noc.im/apache/tomcat/tomcat-6/v6.0.44/bin/apache-tomcat-6.0.44.tar.gz && \
tar -vxf apache-tomcat-*.gz && \
rm -rf *.gz && \
mv apache-tomcat-* tomcat

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 8080
CMD ["/run.sh"]