FROM ruby:2.3.1

USER root

WORKDIR /opt

# chrome driver
RUN apt-get update > /dev/null && apt-get install -y unzip chromedriver libxi6 libgconf-2-4
RUN wget -q http://chromedriver.storage.googleapis.com/2.28/chromedriver_linux64.zip -P /opt/ && \
    unzip /opt/chromedriver_linux64.zip -d /opt/ && \
    chmod +x /opt/chromedriver

RUN gem install bundler cucumber capybara

# startup
COPY assets/startup.sh /opt/startup.sh

WORKDIR /cucumber

ENTRYPOINT [ "/opt/startup.sh" ]
