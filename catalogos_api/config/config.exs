# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :catalogos_api,
  ecto_repos: [CatalogosApi.Repo]

# Configures the endpoint
config :catalogos_api, CatalogosApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J0jF/taqNT/Aiwcnoyi5y1AFGayq+oLJVykIvOJrs1EMUNW2mQOXks5Gox0YFAmD",
  render_errors: [view: CatalogosApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: CatalogosApi.PubSub,
  live_view: [signing_salt: "RZ9eMWAs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Libreria de autenticacion pow

config :catalogos_api, :pow,
  user: CatalogosApi.Users.User,
  repo: CatalogosApi.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
