FROM ubuntu:14.04
MAINTAINER Paul Stack <public@paulstack.co.uk>

RUN apt-get install -y wget
RUN wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
RUN echo "deb http://repos.sensuapp.org/apt sensu main" | sudo tee -a /etc/apt/sources.list.d/sensu.list

RUN apt-get update
RUN apt-get install -y sensu

ENV REDIS_PORT 6379

ENV RABBITMQ_PORT 5671
ENV RABBITMQ_VHOST /
ENV RABBITMQ_USER guest
ENV RABBITMQ_PASS guest

ENV API_USER admin
ENV API_PASS admin

ADD run.sh /tmp/run.sh

# API
EXPOSE 4567

ENTRYPOINT ["/tmp/run.sh"]
