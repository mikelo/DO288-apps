# Use the httpd-parent image as base
FROM quay.io/redhattraining/httpd-parent
EXPOSE 8080
LABEL io.openshift.expose-services="8080:http" io.openshift.tags="apache,httpd" \
io.k8s.description="A basic httpd server image" \
io.k8s.display-name="apache http server"
RUN sed -i 's/^Listen 80/&80/' /etc/httpd/conf/httpd.conf && \
chgrp -R 0 /var/run/httpd /var/log/httpd && \
chmod -R 770 /var/log/httpd /var/run/httpd
USER 1001
