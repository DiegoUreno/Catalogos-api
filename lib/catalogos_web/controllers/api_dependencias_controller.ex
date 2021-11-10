defmodule CatalogosWeb.ApiDependenciasController do
  use CatalogosWeb, :controller

  alias Catalogos.ApiDepes
  alias Catalogos.ApiDepes.ApiDependencias

  action_fallback CatalogosWeb.FallbackController

  def index(conn, _params) do
    dependencias = ApiDepes.list_dependencias()
    render(conn, "index.json", dependencias: dependencias)
  end

  def create(conn, %{"api_dependencias" => api_dependencias_params}) do
    with {:ok, %ApiDependencias{} = api_dependencias} <- ApiDepes.create_api_dependencias(api_dependencias_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_dependencias_path(conn, :show, api_dependencias))
      |> render("show.json", api_dependencias: api_dependencias)
    end
  end

  def show(conn, %{"id" => id}) do
    api_dependencias = ApiDepes.get_api_dependencias!(id)
    render(conn, "show.json", api_dependencias: api_dependencias)
  end

  def update(conn, %{"id" => id, "api_dependencias" => api_dependencias_params}) do
    api_dependencias = ApiDepes.get_api_dependencias!(id)

    with {:ok, %ApiDependencias{} = api_dependencias} <- ApiDepes.update_api_dependencias(api_dependencias, api_dependencias_params) do
      render(conn, "show.json", api_dependencias: api_dependencias)
    end
  end

  def delete(conn, %{"id" => id}) do
    api_dependencias = ApiDepes.get_api_dependencias!(id)

    with {:ok, %ApiDependencias{}} <- ApiDepes.delete_api_dependencias(api_dependencias) do
      send_resp(conn, :no_content, "")
    end
  end
end
