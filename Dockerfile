FROM websphere-liberty
RUN installUtility install  --acceptLicense logstashCollector-1.0 openidConnectServer-1.0 ssl-1.0 appSecurity-2.0
RUN rm -f /config
# need more than one configMap mounted to defaults so split them apart with symlinks
RUN mkdir -p /opt/ibm/wlp/usr/servers/defaultServer/configDropins/defaults
RUN mkdir -p /opt/ibm/wlp/usr/servers/defaultServer/configMount

RUN ln -s  /opt/ibm/wlp/usr/servers/defaultServer/configMount/keystore.xml \ 
 /opt/ibm/wlp/usr/servers/defaultServer/configDropins/defaults/keystore.xml  

RUN ln -s  /opt/ibm/wlp/usr/servers/defaultServer/configMount/logging.xml \
 /opt/ibm/wlp/usr/servers/defaultServer/configDropins/defaults/logging.xml 

# mount the userids
RUN mkdir -p /opt/ibm/wlp/usr/servers/defaultServer/useridMount
RUN ln -s /opt/ibm/wlp/usr/servers/defaultServer/useridMount/userids.xml \
 /opt/ibm/wlp/usr/servers/defaultServer/configDropins/defaults/userids.xml 

# mount the certs
#RUN  mkdir -p /opt/ibm/wlp/usr/servers/defaultServer/resources
#RUN  mkdir -p  /opt/ibm/wlp/usr/servers/defaultServer/certsMount
#RUN  ln -s    /opt/ibm/wlp/usr/servers/defaultServer/certsMount \
# /opt/ibm/wlp/usr/servers/defaultServer/resources/security


COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/server.xml

