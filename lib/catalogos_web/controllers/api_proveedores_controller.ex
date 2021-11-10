defmodule CatalogosWeb.ApiProveedoresController do
  use CatalogosWeb, :controller

  alias Catalogos.ApiProvs
  alias Catalogos.ApiProvs.ApiProveedores

  action_fallback CatalogosWeb.FallbackController

  def index(conn, _params) do
    proveedores = ApiProvs.list_proveedores()
    render(conn, "index.json", proveedores: proveedores)
  end

  def create(conn, %{"api_proveedores" => api_proveedores_params}) do
    with {:ok, %ApiProveedores{} = api_proveedores} <- ApiProvs.create_api_proveedores(api_proveedores_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_proveedores_path(conn, :show, api_proveedores))
      |> render("show.json", api_proveedores: api_proveedores)
    end
  end

  def show(conn, %{"id" => id}) do
    api_proveedores = ApiProvs.get_api_proveedores!(id)
    render(conn, "show.json", api_proveedores: api_proveedores)
  end

  def update(conn, %{"id" => id, "api_proveedores" => api_proveedores_params}) do
    api_proveedores = ApiProvs.get_api_proveedores!(id)

    with {:ok, %ApiProveedores{} = api_proveedores} <- ApiProvs.update_api_proveedores(api_proveedores, api_proveedores_params) do
      render(conn, "show.json", api_proveedores: api_proveedores)
    end
  end

  def delete(conn, %{"id" => id}) do
    api_proveedores = ApiProvs.get_api_proveedores!(id)

    with {:ok, %ApiProveedores{}} <- ApiProvs.delete_api_proveedores(api_proveedores) do
      send_resp(conn, :no_content, "")
    end
  end
end