FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client netcat

WORKDIR /app

COPY . .
RUN bundle install

COPY entrypoint.sh /usr/bin/
COPY daemons_entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/daemons_entrypoint.sh

EXPOSE 3000