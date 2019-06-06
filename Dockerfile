FROM darthjee/ruby_250:0.2.3

ADD Gemfile* /home/app/app/

RUN bundle install
