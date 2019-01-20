# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :ankikorean, AnkikoreanWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qLQOh5nYc2N2i5H7JttZUSvK7/wRqyGYIm4FBHgDB5Nd1VHE4S0ppfFnMiguZeRd",
  render_errors: [view: AnkikoreanWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ankikorean.PubSub,
           adapter: Phoenix.PubSub.PG2],
  server: true

# Scheduler
config :ankikorean, Ankikorean.Scheduler,
  jobs: [
      # Runs every midnight:
    {"@daily",                 {Ankikorean.Cache, :clear, []}}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Tesla
config :tesla, :adapter, Tesla.Adapter.Hackney
