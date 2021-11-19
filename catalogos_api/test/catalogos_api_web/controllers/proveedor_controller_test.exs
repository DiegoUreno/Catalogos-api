defmodule CatalogosApiWeb.ProveedorControllerTest do
  use CatalogosApiWeb.ConnCase

  alias CatalogosApi.CatProvs
  alias CatalogosApi.CatProvs.Proveedor

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:proveedor) do
    {:ok, proveedor} = CatProvs.create_proveedor(@create_attrs)
    proveedor
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all proveedores", %{conn: conn} do
      conn = get(conn, Routes.proveedor_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create proveedor" do
    test "renders proveedor when data is valid", %{conn: conn} do
      conn = post(conn, Routes.proveedor_path(conn, :create), proveedor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.proveedor_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.proveedor_path(conn, :create), proveedor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update proveedor" do
    setup [:create_proveedor]

    test "renders proveedor when data is valid", %{conn: conn, proveedor: %Proveedor{id: id} = proveedor} do
      conn = put(conn, Routes.proveedor_path(conn, :update, proveedor), proveedor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.proveedor_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, proveedor: proveedor} do
      conn = put(conn, Routes.proveedor_path(conn, :update, proveedor), proveedor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete proveedor" do
    setup [:create_proveedor]

    test "deletes chosen proveedor", %{conn: conn, proveedor: proveedor} do
      conn = delete(conn, Routes.proveedor_path(conn, :delete, proveedor))
      assert response(conn, 204)

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
