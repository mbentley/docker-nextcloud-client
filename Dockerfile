# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest

RUN apk add --no-cache nextcloud-client
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
