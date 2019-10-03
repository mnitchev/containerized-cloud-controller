FROM golang:1.12.4 as build
WORKDIR /workspace

COPY statsd-injector-release .
RUN cd src && CGO_ENABLED=0 GOOS=linux go build -mod=vendor -o statsd

FROM alpine
RUN mkdir -p /var/vcap/sys/log/cloud_controller_ng/
COPY --from=0 /workspace/src/statsd .
