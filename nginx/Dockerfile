# This dockerfile uses the centos6.5 image
# VERSION 1
# Author: malei

FROM centos:65
#MAINTAINER malei 

COPY epel.repo /etc/yum.repos.d/
RUN yum install -y  --nogpgcheck nginx
RUN echo "\nstream {\n	include conf.d/*.conf;\n}" >> /etc/nginx/nginx.conf
RUN echo " \
    upstream cmweb {                           \
		hash $remote_addr consistent;  \
        server 192.168.30.99:32772  weight=1;  \
        server 192.168.30.99:32769  weight=1;  \
    }                                         \
\
    server {                                 \
        listen 8199;                         \
        proxy_pass cmweb;                    \
    }                                        \
" >> /etc/nginx/conf.d/cmweb.conf 
RUN echo " \
    upstream cmweb {                        \
		hash $remote_addr consistent; \
        server 192.168.30.99:32772  weight=1; \
        server 192.168.30.99:32769  weight=1; \
    }                                         \
\
    server {                                  \
        listen 8199;                         \
        proxy_pass cmweb;                    \
    }                                        \
" >> /etc/nginx/conf.d/cmsoc.conf          

CMD /usr/sbin/nginx

