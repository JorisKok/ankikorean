use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ankikorean, AnkikoreanWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Binding interfaces
config :ankikorean, :korean_dictionary, AnkikoreanWeb.KrDictMock
