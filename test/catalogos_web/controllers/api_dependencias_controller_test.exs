defmodule CatalogosWeb.ApiDependenciasControllerTest do
  use CatalogosWeb.ConnCase

  alias Catalogos.ApiDepes
  alias Catalogos.ApiDepes.ApiDependencias

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:api_dependencias) do
    {:ok, api_dependencias} = ApiDepes.create_api_dependencias(@create_attrs)
    api_dependencias
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all dependencias", %{conn: conn} do
      conn = get(conn, Routes.api_dependencias_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api_dependencias" do
    test "renders api_dependencias when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_dependencias_path(conn, :create), api_dependencias: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_dependencias_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_dependencias_path(conn, :create), api_dependencias: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api_dependencias" do
    setup [:create_api_dependencias]

    test "renders api_dependencias when data is valid", %{conn: conn, api_dependencias: %ApiDependencias{id: id} = api_dependencias} do
      conn = put(conn, Routes.api_dependencias_path(conn, :update, api_dependencias), api_dependencias: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_dependencias_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, api_dependencias: api_dependencias} do
      conn = put(conn, Routes.api_dependencias_path(conn, :update, api_dependencias), api_dependencias: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api_dependencias" do
    setup [:create_api_dependencias]

    test "deletes chosen api_dependencias", %{conn: conn, api_dependencias: api_dependencias} do
      conn = delete(conn, Routes.api_dependencias_path(conn, :delete, api_dependencias))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_dependencias_path(conn, :show, api_dependencias))
      end
    end
  end

  defp create_api_dependencias(_) do
    api_dependencias = fixture(:api_dependencias)
    %{api_dependencias: api_dependencias}
  end
end
