#
# MailCache Dockerfile
#

FROM golang:1.18-alpine as builder

# Install MailCache:
RUN apk --no-cache add --virtual build-dependencies \
    git \
  && mkdir -p /root/gocode \
  && export GOPATH=/root/gocode \
  && go install github.com/mailcache/mailcache@latest

FROM alpine:3
# Add mailcache user/group with uid/gid 1000.
# This is a workaround for boot2docker issue #581, see
# https://github.com/boot2docker/boot2docker/issues/581
RUN adduser -D -u 1000 mailcache

COPY --from=builder /root/gocode/bin/mailcache /usr/local/bin/

USER mailcache

WORKDIR /home/mailcache

ENTRYPOINT ["mailcache"]

# Expose the SMTP and HTTP ports:
EXPOSE 1025 8025
