defmodule CatalogosWeb.ProveedorController do
  use CatalogosWeb, :controller

  alias Catalogos.CatProveedores
  alias Catalogos.CatProveedores.Proveedor

  def index(conn, param) do
    page=
      Proveedor
      |> Catalogos.Repo.paginate(param)
    render(conn, "index.html", proveedor: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = CatProveedores.change_proveedor(%Proveedor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"proveedor" => proveedor_params}) do
    case CatProveedores.create_proveedor(proveedor_params) do
      {:ok, proveedor} ->
        conn
        |> put_flash(:info, "Proveedor created successfully.")
        |> redirect(to: Routes.proveedor_path(conn, :show, proveedor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    proveedor = CatProveedores.get_proveedor!(id)
    render(conn, "show.html", proveedor: proveedor)
  end

  def edit(conn, %{"id" => id}) do
    proveedor = CatProveedores.get_proveedor!(id)
    changeset = CatProveedores.change_proveedor(proveedor)
    render(conn, "edit.html", proveedor: proveedor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "proveedor" => proveedor_params}) do
    proveedor = CatProveedores.get_proveedor!(id)

    case CatProveedores.update_proveedor(proveedor, proveedor_params) do
      {:ok, proveedor} ->
        conn
        |> put_flash(:info, "Proveedor updated successfully.")
        |> redirect(to: Routes.proveedor_path(conn, :show, proveedor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", proveedor: proveedor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    proveedor = CatProveedores.get_proveedor!(id)
    {:ok, _proveedor} = CatProveedores.delete_proveedor(proveedor)

    conn
    |> put_flash(:info, "Proveedor deleted successfully.")
    |> redirect(to: Routes.proveedor_path(conn, :index))
  end
  def activar(conn, %{"id" => id}) do
    proveedores = CatProveedores.get_proveedor!(id)
    case CatProveedores.update_proveedor(proveedores, %{"activo" => 1}) do
    {:ok, proveedores} ->
      conn
      |> put_flash(:info, "Proveedore actualizado correctamente")
      |>redirect(to: Routes.proveedor_path(conn, :show, proveedores))
    {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "show.html", proveedor: proveedores, changeset: changeset)
    end
  end
  def desactivar(conn, %{"id" => id}) do
    proveedores = CatProveedores.get_proveedor!(id)
    case CatProveedores.update_proveedor(proveedores, %{"activo" => 0}) do
    {:ok, proveedores} ->
      conn
      |> put_flash(:info, "Proveedore actualizado correctamente")
      |>redirect(to: Routes.proveedor_path(conn, :show, proveedores))
    {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "show.html", proveedor: proveedores, changeset: changeset)
    end
  end
end
