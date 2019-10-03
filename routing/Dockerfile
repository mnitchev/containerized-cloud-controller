FROM golang:1.10 as build
WORKDIR $GOPATH/src

COPY routing-release/src .
RUN cd $GOPATH/src/code.cloudfoundry.org/route-registrar && go build -o route-registrar

FROM ubuntu
COPY --from=0 /go/src/code.cloudfoundry.org/route-registrar/route-registrar .
