FROM macromind/docker-apache-php72:latest
MAINTAINER MACROMIND Online <idc@macromind.online>
LABEL description="TRRweb Caminhao"

RUN apt-get update && apt-get install wkhtmltopdf cups -y && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* 
ADD conf/000-docker.conf /etc/apache2/sites-available/
RUN /usr/sbin/a2dissite '*' && /usr/sbin/a2ensite 000-docker
COPY install_pos /usr/local/bin/
COPY services /usr/local/bin/

EXPOSE 80

CMD ["services"]
