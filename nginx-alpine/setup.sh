#!/bin/sh

if [ ! -z $WEB_FOLDER ]
then
    echo "Switching nginx directory to /urs/src/app/$WEB_FOLDER"
    sed -i "s@#WEB_FOLDER#@$WEB_FOLDER@g" /etc/nginx/conf.d/default.conf
fi
if [ ! -z $INDEX_FILE ]
then
    echo "Switching nginx index file to $INDEX_FILE"
    sed -i "s@#INDEX_FILE#@$INDEX_FILE@g" /etc/nginx/conf.d/default.conf
fi

if [ ! -z $VIRTUAL_DOMAIN ]
then
    echo "Switching nginx virtual host to $VIRTUAL_DOMAIN"
    sed -i "s@#VIRTUAL_DOMAIN#@$VIRTUAL_DOMAIN@g" /etc/nginx/conf.d/default.conf
fi

cat /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'