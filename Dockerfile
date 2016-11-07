FROM elixir:1.3.4

# install psql
RUN apt-get update && apt-get install -y postgresql-client inotify-tools

WORKDIR /app

CMD ["mix", "buildandrun"]
