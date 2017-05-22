FROM ruby:2.3.1-alpine

USER root

# adduser
RUN adduser -D -s /bin/bash -h /cucumber cucumber

RUN apk add --update wget g++ gcc make bash && \
    apk add openssl ca-certificates && \
    update-ca-certificates

WORKDIR /opt

# phantomjs driver
ENV phantom_file=phantomjs-2.1.1-linux-x86_64
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$phantom_file.tar.bz2 -q
RUN bzip2 -d $phantom_file.tar.bz2
RUN tar -xvf $phantom_file.tar
RUN mv $phantom_file phantomjs
RUN chown -R cucumber:cucumber phantomjs

# user
USER cucumber
WORKDIR /cucumber

# startup
COPY assets/startup.sh /opt/startup.sh

CMD ["/opt/startup.sh"]