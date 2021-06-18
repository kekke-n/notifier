FROM ruby:3.0.1

ENV TZ 'Asia/Tokyo'

# Add packages
RUN apt-get update && apt-get install -y \
      git \
      vim \
      less \
      ruby-dev \
      cron \
      sqlite3 libsqlite3-dev

COPY . /app
WORKDIR /app
RUN gem install bundler
RUN bundle install

# Cron
RUN bundle exec whenever --update-crontab -e development
