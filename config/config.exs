# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cardrooms,
  ecto_repos: [Cardrooms.Repo]

# Configures the endpoint
config :cardrooms, Cardrooms.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eAkAGpGB2vSXJTuVcOgWN2uAVD7FS0yp2a9w5YdAtimyV8N3nji3x4QbXl2KJnvn",
  render_errors: [view: Cardrooms.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cardrooms.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
