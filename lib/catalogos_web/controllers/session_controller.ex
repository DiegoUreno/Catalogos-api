 defmodule CatalogosWeb.SessionController do
   use CatalogosWeb, :controller
   alias Catalogos.Accounts
   alias Catalogos.Guardian

   action_fallback CatalogosWeb.FallbackController

   def new(conn, %{"email" => email, "password" => password}) do
    case Accounts.auth_user(email, password) do
      {:ok, user} ->
        {:ok, access_token, _claims} =
           Guardian.encode_and_sign(user, %{}, token_type: "access", ttl: {15, :minute})
      {:ok, refresh_token, _claims} =
          Guardian.encode_and_sign(user, %{}, token_type: "refresh", ttl: {7, :day})
      conn
      |> put_resp_cookie("ruid", refresh_token)
      |> put_status(:created)
      |> render("token.json", access_token: access_token)

      {:error, :unauthorized} ->
        body = Jason.encode!(%{error: "unauthorized"})
        conn |> send_resp(401, body)

    end

   end

   def refresh(conn, _params) do
    refresh_token =
      Plug.Conn.fetch_cookies(conn) |> Map.from_struct() |> get_in([cookies: "ruid"])
      case Guardian.exchange(refresh_token, "refresh", "access") do
      {:ok, _old_stuff, {new_access_token, _new_claims}} ->
        conn
        |> put_status(:created)
        |> render("token.json", %{access_token: new_access_token})

        {:error, _reason} ->
          body = Jason.encode!(%{error: "unauthorized"})
          conn |> send_resp(401, body)
      end

   end

   def delete(conn, _params) do
   conn
   |>delete_resp_cookie("ruid")
   |> put_status(200)
   |>text("logged out")
   end
 end