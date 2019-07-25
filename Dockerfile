FROM golang:alpine AS build-env
ENV GO111MODULE=on
WORKDIR /go/src/go-getbox

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

COPY . .

# final stage
FROM alpine
WORKDIR /app
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY --from=build-env /go/src/go-getbox/config.yml .
COPY --from=build-env /go/src/go-getbox/go-getbox . 
RUN chmod +x ./go-getbox
ENTRYPOINT ./go-getbox