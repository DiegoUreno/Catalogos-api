defmodule Catalogos.Repo do
  use Ecto.Repo,
    otp_app: :catalogos,
    adapter: Ecto.Adapters.MyXQL
    use Scrivener, page_size: 10
end
