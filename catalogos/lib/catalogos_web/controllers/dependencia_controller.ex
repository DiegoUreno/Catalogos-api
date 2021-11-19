defmodule CatalogosWeb.DependenciaController do
  use CatalogosWeb, :controller

  alias Catalogos.CatDependencias
  alias Catalogos.CatDependencias.Dependencia

  def index(conn, param) do
    page =
      Dependencia
      |> Catalogos.Repo.paginate(param)
    render(conn, "index.html", dependencia: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = CatDependencias.change_dependencia(%Dependencia{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dependencia" => dependencia_params}) do
    case CatDependencias.create_dependencia(dependencia_params) do
      {:ok, dependencia} ->
        conn
        |> put_flash(:info, "Dependencia created successfully.")
        |> redirect(to: Routes.dependencia_path(conn, :show, dependencia))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dependencia = CatDependencias.get_dependencia!(id)
    render(conn, "show.html", dependencia: dependencia)
  end

  def edit(conn, %{"id" => id}) do
    dependencia = CatDependencias.get_dependencia!(id)
    changeset = CatDependencias.change_dependencia(dependencia)
    render(conn, "edit.html", dependencia: dependencia, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dependencia" => dependencia_params}) do
    dependencia = CatDependencias.get_dependencia!(id)

    case CatDependencias.update_dependencia(dependencia, dependencia_params) do
      {:ok, dependencia} ->
        conn
        |> put_flash(:info, "Dependencia updated successfully.")
        |> redirect(to: Routes.dependencia_path(conn, :show, dependencia))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dependencia: dependencia, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dependencia = CatDependencias.get_dependencia!(id)
    {:ok, _dependencia} = CatDependencias.delete_dependencia(dependencia)

    conn
    |> put_flash(:info, "Dependencia deleted successfully.")
    |> redirect(to: Routes.dependencia_path(conn, :index))
  end

  def activar(conn, %{"id" => id}) do
    dependencias = CatDependencias.get_dependencia!(id)

    case CatDependencias.update_dependencia(dependencias, %{"activo" => 1}) do
    {:ok, dependencias} ->
      conn
      |> put_flash(:info, "Dependencia actualizada correctamente")
      |> redirect(to: Routes.dependencia_path(conn, :show, dependencias))

    {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "show.html", dependencia: dependencias, changeset: changeset)
    end

  end

  def desactiv(conn, %{"id" => id}) do
    dependencias = CatDependencias.get_dependencia!(id)

    case CatDependencias.update_dependencia(dependencias, %{"activo" => 0}) do
    {:ok, dependencias} ->
      conn
      |> put_flash(:info, "Dependencia actualizada correctamente")
      |> redirect(to: Routes.dependencia_path(conn, :show, dependencias))

    {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "show.html", dependencia: dependencias, changeset: changeset)
    end

  end
end
