FROM ruby:2.3.1

USER root

# adduser
RUN useradd -ms /bin/bash -d /cucumber/ cucumber

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