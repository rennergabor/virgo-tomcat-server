FROM java:8-jre-alpine
MAINTAINER Gabor Renner <grenner@intrend.hu>

ENV VIRGO_VERSION 3.6.4.RELEASE

RUN apk update
RUN apk add curl libarchive-tools bash

RUN adduser -D -s /bin/bash -h /home/virgo virgo
ENV HOME /home/virgo

RUN \
    curl -o virgo.zip -L http://www.eclipse.org/downloads/download.php?file=/virgo/release/VP/$VIRGO_VERSION/virgo-tomcat-server-$VIRGO_VERSION.zip\&r=1 && \
    bsdtar --strip-components 1 -C /home/virgo -xzf virgo.zip && \
    rm virgo.zip && \
    chmod u+x /home/virgo/bin/* && \
    chown -R virgo:virgo /home/virgo

USER virgo

WORKDIR /home/virgo
EXPOSE 8080

CMD bin/startup.sh
