defmodule CatalogosApiWeb.DependenciaControllerTest do
  use CatalogosApiWeb.ConnCase

  alias CatalogosApi.CatDeps
  alias CatalogosApi.CatDeps.Dependencia

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:dependencia) do
    {:ok, dependencia} = CatDeps.create_dependencia(@create_attrs)
    dependencia
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all dependencias", %{conn: conn} do
      conn = get(conn, Routes.dependencia_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dependencia" do
    test "renders dependencia when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dependencia_path(conn, :create), dependencia: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.dependencia_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dependencia_path(conn, :create), dependencia: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dependencia" do
    setup [:create_dependencia]

    test "renders dependencia when data is valid", %{conn: conn, dependencia: %Dependencia{id: id} = dependencia} do
      conn = put(conn, Routes.dependencia_path(conn, :update, dependencia), dependencia: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.dependencia_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dependencia: dependencia} do
      conn = put(conn, Routes.dependencia_path(conn, :update, dependencia), dependencia: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dependencia" do
    setup [:create_dependencia]

    test "deletes chosen dependencia", %{conn: conn, dependencia: dependencia} do
      conn = delete(conn, Routes.dependencia_path(conn, :delete, dependencia))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.dependencia_path(conn, :show, dependencia))
      end
    end
  end

  defp create_dependencia(_) do
    dependencia = fixture(:dependencia)
    %{dependencia: dependencia}
  end
end
