FROM alpine:latest

COPY ./rds_exporter/  /bin/
RUN ls -al /bin/rds_exporter
# COPY config.yml           /etc/rds_exporter/config.yml

RUN apk update && \
    apk add --no-cache ca-certificates && \
    update-ca-certificates

EXPOSE 9042
ENTRYPOINT [ "/bin/rds_exporter", "--config.file=/etc/rds_exporter/config.yml" ]
