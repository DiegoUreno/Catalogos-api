defmodule CatalogosApiWeb.DependenciaController do
  use CatalogosApiWeb, :controller

  alias CatalogosApi.CatDeps
  alias CatalogosApi.CatDeps.Dependencia

  action_fallback CatalogosApiWeb.FallbackController

  def index(conn, _params) do
    dependencias = CatDeps.list_dependencias()
    render(conn, "index.json", dependencias: dependencias)
  end

  def create(conn, %{"dependencia" => dependencia_params}) do
    with {:ok, %Dependencia{} = dependencia} <- CatDeps.create_dependencia(dependencia_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.dependencia_path(conn, :show, dependencia))
      |> render("show.json", dependencia: dependencia)
    end
  end

  def show(conn, %{"id" => id}) do
    dependencia = CatDeps.get_dependencia!(id)
    render(conn, "show.json", dependencia: dependencia)
  end

  def update(conn, %{"id" => id, "dependencia" => dependencia_params}) do
    dependencia = CatDeps.get_dependencia!(id)

    with {:ok, %Dependencia{} = dependencia} <- CatDeps.update_dependencia(dependencia, dependencia_params) do
      render(conn, "show.json", dependencia: dependencia)
    end
  end

  def delete(conn, %{"id" => id}) do
    dependencia = CatDeps.get_dependencia!(id)

    with {:ok, %Dependencia{}} <- CatDeps.delete_dependencia(dependencia) do
      send_resp(conn, :no_content, "")
    end
  end
end
