FROM docker.elastic.co/beats/filebeat:7.16.3
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN [ -d /var/logs ] || mkdir /var/logs
RUN chown -R root /usr/share/filebeat