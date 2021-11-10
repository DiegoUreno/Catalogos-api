defmodule CatalogosWeb.ApiProveedoresControllerTest do
  use CatalogosWeb.ConnCase

  alias Catalogos.ApiProvs
  alias Catalogos.ApiProvs.ApiProveedores

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:api_proveedores) do
    {:ok, api_proveedores} = ApiProvs.create_api_proveedores(@create_attrs)
    api_proveedores
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all proveedores", %{conn: conn} do
      conn = get(conn, Routes.api_proveedores_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api_proveedores" do
    test "renders api_proveedores when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_proveedores_path(conn, :create), api_proveedores: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_proveedores_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_proveedores_path(conn, :create), api_proveedores: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api_proveedores" do
    setup [:create_api_proveedores]

    test "renders api_proveedores when data is valid", %{conn: conn, api_proveedores: %ApiProveedores{id: id} = api_proveedores} do
      conn = put(conn, Routes.api_proveedores_path(conn, :update, api_proveedores), api_proveedores: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_proveedores_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, api_proveedores: api_proveedores} do
      conn = put(conn, Routes.api_proveedores_path(conn, :update, api_proveedores), api_proveedores: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api_proveedores" do
    setup [:create_api_proveedores]

    test "deletes chosen api_proveedores", %{conn: conn, api_proveedores: api_proveedores} do
      conn = delete(conn, Routes.api_proveedores_path(conn, :delete, api_proveedores))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_proveedores_path(conn, :show, api_proveedores))
      end
    end
  end

  defp create_api_proveedores(_) do
    api_proveedores = fixture(:api_proveedores)
    %{api_proveedores: api_proveedores}
  end
end
