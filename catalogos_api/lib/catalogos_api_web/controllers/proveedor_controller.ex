defmodule CatalogosApiWeb.ProveedorController do
  use CatalogosApiWeb, :controller

  alias CatalogosApi.CatProvs
  alias CatalogosApi.CatProvs.Proveedor

  action_fallback CatalogosApiWeb.FallbackController

  def index(conn, _params) do
    proveedores = CatProvs.list_proveedores()
    render(conn, "index.json", proveedores: proveedores)
  end

  def create(conn, %{"proveedor" => proveedor_params}) do
    with {:ok, %Proveedor{} = proveedor} <- CatProvs.create_proveedor(proveedor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.proveedor_path(conn, :show, proveedor))
      |> render("show.json", proveedor: proveedor)
    end
  end

  def show(conn, %{"id" => id}) do
    proveedor = CatProvs.get_proveedor!(id)
    render(conn, "show.json", proveedor: proveedor)
  end

  def update(conn, %{"id" => id, "proveedor" => proveedor_params}) do
    proveedor = CatProvs.get_proveedor!(id)

    with {:ok, %Proveedor{} = proveedor} <- CatProvs.update_proveedor(proveedor, proveedor_params) do
      render(conn, "show.json", proveedor: proveedor)
    end
  end

  def delete(conn, %{"id" => id}) do
    proveedor = CatProvs.get_proveedor!(id)

    with {:ok, %Proveedor{}} <- CatProvs.delete_proveedor(proveedor) do
      send_resp(conn, :no_content, "")
    end
  end
end
