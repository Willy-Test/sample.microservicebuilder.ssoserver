FROM websphere-liberty
RUN installUtility install  --acceptLicense logstashCollector-1.0 openidConnectServer-1.0 ssl-1.0 appSecurity-2.0
RUN rm -f /config

# mount the certs
#RUN  mkdir -p /opt/ibm/wlp/usr/servers/defaultServer/resources
#RUN  mkdir -p  /opt/ibm/wlp/usr/servers/defaultServer/certsMount
#RUN  ln -s    /opt/ibm/wlp/usr/servers/defaultServer/certsMount \
# /opt/ibm/wlp/usr/servers/defaultServer/resources/security

COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/server.xml

