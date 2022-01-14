FROM docker.io/library/python:latest
MAINTAINER sanmuk21@gmail.com

WORKDIR /app

RUN pip install flask && \
    apt update && \
    apt install nginx -y

ADD . /app

RUN rm -f /etc/nginx/sites-enabled/default && \
    cp /app/app.conf /etc/nginx/sites-enabled/

EXPOSE 8080

CMD nginx && python app.py
