FROM ubuntu:xenial as build
WORKDIR /workspace

RUN apt-get update && apt-get install -y patch gcc g++ libssl-dev make
RUN mkdir nginx
COPY build-nginx.sh .
COPY nginx nginx
RUN /workspace/build-nginx.sh

FROM ubuntu:xenial
RUN apt-get update && apt-get install -y patch gcc g++ libssl-dev make && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/vcap/sys/log/cloud_controller_ng/
COPY --from=0 /usr/local/nginx/ /usr/local/nginx
