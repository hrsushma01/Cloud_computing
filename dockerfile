FROM ubuntu:20.04

LABEL maintainer="HottegowdanakoppalRamgowdaSushma hottegowdanakoppalramegowdas@uqconnect.edu.au"


ENV PHPVER=8.2
ENV TZ=AEST

RUN apt-get update -y \
        && apt-get install software-properties-common -y \
        && add-apt-repository ppa:ondrej/php -y \
        && apt-get update && apt-get install -y wget \
        && apt-get install nginx php${PHPVER}-fpm -y

RUN wget https://raw.githubusercontent.com/csenw/cca1/master/src/nginx.ini -P /etc/nginx/sites-available/ \
        && mv /etc/nginx/sites-available/nginx.ini /etc/nginx/sites-available/default \
        && rm -rf /var/www/html/index.nginx-debian.html \
        && wget https://raw.githubusercontent.com/csenw/cca1/master/src/index.php -P /var/www/html/ \
        && wget https://raw.githubusercontent.com/csenw/cca1/master/src/index.html -P /var/www/html/


EXPOSE 80

VOLUME /var/www/html

WORKDIR /var/www/html

#entrypoint
RUN echo "PHP Version:" ${PHPVER} " Time Zone:" $TimeZone > /usr/configuration_output.txt \
        && chmod -R +x /var/www/html/

ENTRYPOINT service nginx restart
ENTRYPOINT service php${PHPVER}-fpm start && nginx -g "daemon off;"
~                                                                                                                                                                                                
~                                                                                                                                                                                                
~                                                                                                                                                                                                
~                                                                                                                                                                                                
~                                                                                                                                                                                                
~                                                                                                                                                                                                
~                                                                                                                                                                                                
~                                                                                                                                                                                                
~                                                                                                                                                                                                
"dockerfile" 33L, 1141C    