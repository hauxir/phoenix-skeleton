FROM voidlock/elixir:1.1

# install psql
RUN apt-get update && apt-get install -y postgresql-client

# install mix and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# configure work directory
RUN mkdir -p /app
WORKDIR /app

# install dependencies
COPY . /app
RUN mix deps.get
RUN MIX_ENV=prod mix compile

CMD ["mix", "phoenix.server"]
