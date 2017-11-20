FROM ruby:2.3.1

USER root

WORKDIR /opt

# chrome driver
RUN apt-get update > /dev/null && apt-get install -y unzip chromedriver libxi6 libgconf-2-4
RUN wget -q http://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip -P /opt/ && \
    unzip /opt/chromedriver_linux64.zip -d /opt/ && \
    chmod +x /opt/chromedriver

# startup
COPY assets/startup.sh /opt/startup.sh

RUN useradd -ms /bin/bash -d /cucumber/ cucumber
USER cucumber

RUN gem install bundler

WORKDIR /cucumber

ENTRYPOINT [ "/opt/startup.sh" ]
