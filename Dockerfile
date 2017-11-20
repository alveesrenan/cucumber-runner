FROM ruby:2.3.1

USER root

# adduser
RUN useradd -ms /bin/bash -d /cucumber/ cucumber

WORKDIR /opt

# chrome driver
RUN apt-get update > /dev/null && apt-get install -y unzip chromedriver libxi6 libgconf-2-4
RUN wget -q http://chromedriver.storage.googleapis.com/2.28/chromedriver_linux64.zip -P /opt/ && \
    unzip /opt/chromedriver_linux64.zip -d /opt/ && \
    chmod +x /opt/chromedriver

# user
USER cucumber
WORKDIR /cucumber

RUN gem install bundler cucumber capybara

# startup
COPY assets/startup.sh /opt/startup.sh

ENTRYPOINT [ "/opt/startup.sh" ]
