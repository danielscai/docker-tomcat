FROM tutum/tomcat
MAINTAINER Daniels Cai <daniels_cai@zeuscloud.cn>

RUN apt-get update \
 && apt-get install -y --no-install-recommends supervisor \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ADD tomcat.conf /etc/supervisor/conf.d/tomcat.conf

EXPOSE 8080
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
