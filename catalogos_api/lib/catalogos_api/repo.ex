defmodule CatalogosApi.Repo do
  use Ecto.Repo,
    otp_app: :catalogos_api,
    adapter: Ecto.Adapters.MyXQL
end
