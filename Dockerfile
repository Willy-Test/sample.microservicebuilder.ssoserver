FROM websphere-liberty:webProfile7
MAINTAINER IBM Java engineering at IBM Cloud
COPY server.xml /config/server.xml
COPY com.ibm.apm.dataCollector-7.4.esa /opt/
# Install required features if not present
RUN installUtility install --acceptLicense logstashCollector-1.0 openidConnectServer-1.0 ssl-1.0 appSecurity-2.0 && installUtility install --acceptLicense defaultServer && installUtility install --acceptLicense /opt/com.ibm.apm.dataCollector-7.4.esa
RUN /opt/ibm/wlp/usr/extension/liberty_dc/bin/config_liberty_dc.sh -silent /opt/ibm/wlp/usr/extension/liberty_dc/bin/silent_config_liberty_dc.txt

RUN rm -f /config

# mount the certs
#RUN  mkdir -p /opt/ibm/wlp/usr/servers/defaultServer/resources
#RUN  mkdir -p  /opt/ibm/wlp/usr/servers/defaultServer/certsMount
#RUN  ln -s    /opt/ibm/wlp/usr/servers/defaultServer/certsMount \
# /opt/ibm/wlp/usr/servers/defaultServer/resources/security

COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/server.xml

