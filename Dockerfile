FROM ruby:2.5.0
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
  libpq-dev \
  qt5-default \
  libqt5webkit-dev \
  nodejs

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install

COPY .sample.env /app/.env
COPY . /app/