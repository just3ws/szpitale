FROM ruby:alpine

RUN apk add --update build-base postgresql-dev tzdata

RUN mkdir -p /app

WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./

RUN gem install bundler --pre
RUN bundle install --jobs 4 --retry 5

COPY . ./

EXPOSE 3000

CMD bundle exec rails server -b 0.0.0.0 -p 3000 --no-dev-caching
