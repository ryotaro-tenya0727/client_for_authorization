FROM ruby:latest
RUN apt-get update
RUN apt-get install -y build-essential
WORKDIR /client
COPY Gemfile /client/
RUN bundle install
EXPOSE 3004
CMD bundle exec rails s -p 3004 -b '0.0.0.0'