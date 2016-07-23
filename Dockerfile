FROM java:8-jre-alpine
MAINTAINER Gabor Renner <grenner@intrend.hu>

RUN apk update
RUN apk add curl libarchive-tools bash

RUN adduser -S -H virgo
RUN mkdir -p /home/virgo 

RUN curl -L "http://www.eclipse.org/downloads/download.php?file=/virgo/release/VP/3.6.4.RELEASE/virgo-tomcat-server-3.6.4.RELEASE.zip&mirror_id=580&r=1" > virgo.zip
RUN bsdtar --strip-components 1 -C /home/virgo -xzf virgo.zip

RUN chmod u+x /home/virgo/bin/*
RUN chown -R virgo /home/virgo
USER virgo

WORKDIR /home/virgo

EXPOSE 8080

CMD bin/startup.sh
