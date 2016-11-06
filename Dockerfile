FROM voidlock/elixir:1.1

# install psql
RUN apt-get update && apt-get install -y postgresql-client

# install mix and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# configure work directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install dependencies
COPY . /usr/src/app/
RUN mix do deps.get, deps.compile
RUN mix deps.get

CMD ["mix", "phoenix.server"]
