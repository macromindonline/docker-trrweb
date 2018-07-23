FROM macromind/docker-apache-php72:latest
MAINTAINER MACROMIND Online <idc@macromind.online>
LABEL description="TRRweb Caminhao"

RUN apt-get update && apt-get install wkhtmltopdf cups -y && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
ADD conf/000-docker.conf /etc/apache2/sites-available/
RUN /usr/sbin/a2dissite '*' && /usr/sbin/a2ensite 000-docker
COPY services /usr/local/bin/
COPY install80 /usr/local/bin/

EXPOSE 80 631 901

CMD ["services"]
