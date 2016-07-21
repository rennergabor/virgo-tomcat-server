FROM java:8-jre-alpine
MAINTAINER Gabor Renner <grenner@intrend.hu>

RUN apk update
RUN apk add curl libarchive-tools bash

RUN curl -L http://www.eclipse.org/downloads/download.php?file=/virgo/release/VP/3.6.4.RELEASE/virgo-tomcat-server-3.6.4.RELEASE.zip&mirror_id=96 | bsdtar --strip-components 1 -C /home/virgo -xzf -

RUN chmod u+x /home/virgo/bin/*.sh
RUN chown -R virgo /home/virgo
RUN adduser virgo
USER virgo

CMD /home/virgo/bin/startup.sh
