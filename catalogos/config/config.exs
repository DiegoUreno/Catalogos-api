# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :catalogos,
  ecto_repos: [Catalogos.Repo]

# Configures the endpoint
config :catalogos, CatalogosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DcI50/Rtv9L5zaz8YlLux6CfiVj7LfWWNlAk+9HqNeu5wpj6XYFSwskn4eW5O9Dt",
  render_errors: [view: CatalogosWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Catalogos.PubSub,
  live_view: [signing_salt: "KbudTOuE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#Pow
config :catalogos, :pow,
  user: Catalogos.Users.User,
  repo: Catalogos.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
