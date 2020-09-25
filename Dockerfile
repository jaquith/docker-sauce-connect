FROM alpine:3.10 as build

ENV SAUCE_VERSION 4.6.2

RUN apk update && apk add wget && rm -rf /var/cache/apk/*

RUN wget https://saucelabs.com/downloads/sc-$SAUCE_VERSION-linux.tar.gz -O - | tar -xz

RUN ls -la
RUN mkdir -p /out/bin && \
  cp sc-$SAUCE_VERSION-linux/bin/sc  /out/bin/

FROM debian:jessie-slim
LABEL maintainer="Caleb Jaquith (caleb.jaquith@tealium.com)"
COPY --from=build /out /usr/local

RUN apt-get update -qqy \
 && apt-get install -qqy \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD /certs/op_cert.crt /usr/local/share/ca-certificates/op_cert.crt
RUN ls -lhr /usr/local/share/ca-certificates/
RUN chmod 644 /usr/local/share/ca-certificates/op_cert.crt && update-ca-certificates -v
RUN awk -v cmd='openssl x509 -noout -subject' ' /BEGIN/{close(cmd)};{print | cmd}' < /etc/ssl/certs/ca-certificates.crt

# ENTRYPOINT ["sc"]

EXPOSE 4445
EXPOSE 8032

CMD ["--version"]

RUN echo '\n\nGoodbye!!!\n\n'

