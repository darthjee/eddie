FROM ruby:2.5.0

RUN mkdir -p /home/app/app

ADD Gemfile* /home/app/app/

RUN useradd -u 1000 app; \
    mkdir -p /home/app/app; \
    chown app.app -R /home/app

USER app
WORKDIR /home/app/app

RUN gem install bundler && bundle install
