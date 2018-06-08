FROM arm32v6/alpine

LABEL maintainer="douglas.zuqueto@gmail.com"

COPY ./portainer /

VOLUME /data

WORKDIR /

EXPOSE 9000

ENTRYPOINT ["/portainer"]
