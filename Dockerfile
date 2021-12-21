# base image
FROM alpine:latest AS base
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk --no-cache upgrade --purge

# copy over the contents into a new image and add my customizations
FROM scratch
COPY --from=base / /

RUN apk add --no-cache nextcloud-client
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
