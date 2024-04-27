FROM ruby:3.3.0
RUN apt-get update
RUN apt-get install -y build-essential
WORKDIR /client
COPY Gemfile /client/
RUN bundle install
EXPOSE 3004
ENTRYPOINT rm -f /client/tmp/pids/server.pid && bundle exec rails s -p 3004 -b '0.0.0.0'
