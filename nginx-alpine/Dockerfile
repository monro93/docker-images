FROM nginx:1.15.3-alpine
LABEL Author="Albert Montolio <albertmonro@gmail.com>" Description="Very basic nginx image based on alpine"

ENV WEB_FOLDER public
ENV INDEX_FILE index.php
ENV VIRTUAL_DOMAIN localhost

ADD config/default.conf /etc/nginx/conf.d/default.conf

ADD setup.sh /opt/utils/
RUN chmod +x /opt/utils/setup.sh


ENTRYPOINT ["/opt/utils/setup.sh"]