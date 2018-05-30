FROM arm32v6/alpine

COPY ./portainer /

VOLUME /data

WORKDIR /

EXPOSE 9000

ENTRYPOINT ["/portainer"]
