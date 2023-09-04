FROM --platform=linux/amd64 public.ecr.aws/docker/library/ruby:3.0-bullseye

RUN --mount=type=cache,target=/var/lib/apt --mount=type=cache,target=/var/cache/apt apt-get update && \
  apt-get install -y --no-install-recommends \
  build-essential tzdata ca-certificates default-libmysqlclient-dev

WORKDIR /app

COPY Gemfile Gemfile.lock /app

RUN bundle config set path vendor/bundle
RUN --mount=type=cache,target=/app/vendor/bundle bundle install -j4

COPY . /app

EXPOSE 8080

CMD ["bundle", "exec", "rails", "server", "-p", "8080", "-b", "0.0.0.0"]
