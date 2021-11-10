defmodule CatalogosWeb.UserController do
  use CatalogosWeb, :controller

  alias Catalogos.Accounts
  alias Catalogos.Accounts.User

  action_fallback CatalogosWeb.FallbackController


  def register(conn, %{"user" => user_params}) do
  with {:ok, user} <- Accounts.create_user(user_params) do
  conn
  |> put_status(:created)
  |> text("Usuario creado correctamente con el email" <> " " <> user.email)
    end
  end
end
