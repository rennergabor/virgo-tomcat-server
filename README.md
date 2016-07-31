docker-virgo
===============

Dockerfile for trusted builds of [Eclipse Virgo](https://eclipse.org/virgo/) on https://registry.hub.docker.com/u/rennergabor/virgo-tomcat-server/
Images based on official Java8 JRE (Alpine) [java:8-jre-alpine](https://github.com/docker-library/openjdk/blob/54c64cf47d2b705418feb68b811419a223c5a040/8-jre/alpine/Dockerfile)

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
      - /work/virgo/target/configuration:/home/virgo/configuration
      - /work/virgo/target/pickup:/home/virgo/pickup
      - /work/virgo/target/repository/usr:/home/virgo/repository/usr

``` 
 and then `docker-compose up` 
