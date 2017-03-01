[![Build Status](https://travis-ci.org/rennergabor/virgo-tomcat-server.svg?branch=master)](https://travis-ci.org/rennergabor/virgo-tomcat-server)
[![Docker Pulls](https://img.shields.io/docker/pulls/rennergabor/virgo-tomcat-server.svg?maxAge=2592000)](https://hub.docker.com/r/rennergabor/virgo-tomcat-server)
[![](https://images.microbadger.com/badges/image/rennergabor/virgo-tomcat-server.svg)](https://microbadger.com/images/rennergabor/virgo-tomcat-server)

docker-virgo
============

Dockerfile for trusted builds of [Eclipse Virgo](https://eclipse.org/virgo/) on https://registry.hub.docker.com/u/rennergabor/virgo-tomcat-server/
Images based on Java8 JRE (Alpine) [openjdk:8-jre-alpine](https://github.com/docker-library/openjdk/blob/54c64cf47d2b705418feb68b811419a223c5a040/8-jre/alpine/Dockerfile) or Java7 JRE (Alpine) [openjdk:7-jre-alpine](https://github.com/docker-library/openjdk/blob/54c64cf47d2b705418feb68b811419a223c5a040/7-jre/alpine/Dockerfile) respectively

## Customize your container

Virgo server has been installed to the `/opt/virgo/` directory, so your application can be deployed into `/opt/virgo/pickup`. 
If you build your own image, you can have a Dockerfile like
```
FROM rennergabor/virgo-tomcat-server:3.6.4

ADD my-app.jar /opt/virgo/pickup
```

and then `docker build .` your own image.

Or you might simply mount your application jar file as a [docker volume](https://docs.docker.com/engine/tutorials/dockervolumes/#/mount-a-host-file-as-a-data-volume).

	docker run -p 8080:8080 -v path/to/my/app.jar:/opt/virgo/pickup/app.jar rennergabor/virgo-tomcat-server


With [Docker Compose](https://docs.docker.com/compose/) a sample docker-compose.yml might be the following:
```
version: '2'
services:
  virgo:
    image: rennergabor/virgo-tomcat-server:3.6.4
    volumes:
      - /work/virgo/target/configuration:/opt/virgo/configuration
      - /work/virgo/target/pickup:/opt/virgo/pickup
      - /work/virgo/target/repository/usr:/opt/virgo/repository/usr

``` 

 and then `docker-compose up` do the trick. 
