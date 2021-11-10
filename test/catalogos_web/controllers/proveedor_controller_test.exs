defmodule CatalogosWeb.ProveedorControllerTest do
  use CatalogosWeb.ConnCase

  alias Catalogos.CatProveedores

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:proveedor) do
    {:ok, proveedor} = CatProveedores.create_proveedor(@create_attrs)
    proveedor
  end

  describe "index" do
    test "lists all proveedores", %{conn: conn} do
      conn = get(conn, Routes.proveedor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Proveedores"
    end
  end

  describe "new proveedor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.proveedor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Proveedor"
    end
  end

  describe "create proveedor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.proveedor_path(conn, :create), proveedor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.proveedor_path(conn, :show, id)

      conn = get(conn, Routes.proveedor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Proveedor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.proveedor_path(conn, :create), proveedor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Proveedor"
    end
  end

  describe "edit proveedor" do
    setup [:create_proveedor]

    test "renders form for editing chosen proveedor", %{conn: conn, proveedor: proveedor} do
      conn = get(conn, Routes.proveedor_path(conn, :edit, proveedor))
      assert html_response(conn, 200) =~ "Edit Proveedor"
    end
  end

  describe "update proveedor" do
    setup [:create_proveedor]

    test "redirects when data is valid", %{conn: conn, proveedor: proveedor} do
      conn = put(conn, Routes.proveedor_path(conn, :update, proveedor), proveedor: @update_attrs)
      assert redirected_to(conn) == Routes.proveedor_path(conn, :show, proveedor)

      conn = get(conn, Routes.proveedor_path(conn, :show, proveedor))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, proveedor: proveedor} do
      conn = put(conn, Routes.proveedor_path(conn, :update, proveedor), proveedor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Proveedor"
    end
  end

  describe "delete proveedor" do
    setup [:create_proveedor]

    test "deletes chosen proveedor", %{conn: conn, proveedor: proveedor} do
      conn = delete(conn, Routes.proveedor_path(conn, :delete, proveedor))
      assert redirected_to(conn) == Routes.proveedor_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.proveedor_path(conn, :show, proveedor))
      end
    end
  end

  defp create_proveedor(_) do
    proveedor = fixture(:proveedor)
    %{proveedor: proveedor}
  end
end
