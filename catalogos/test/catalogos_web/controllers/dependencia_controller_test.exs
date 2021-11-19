defmodule CatalogosWeb.DependenciaControllerTest do
  use CatalogosWeb.ConnCase

  alias Catalogos.CatDependencias

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:dependencia) do
    {:ok, dependencia} = CatDependencias.create_dependencia(@create_attrs)
    dependencia
  end

  describe "index" do
    test "lists all dependencias", %{conn: conn} do
      conn = get(conn, Routes.dependencia_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Dependencias"
    end
  end

  describe "new dependencia" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dependencia_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dependencia"
    end
  end

  describe "create dependencia" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dependencia_path(conn, :create), dependencia: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dependencia_path(conn, :show, id)

      conn = get(conn, Routes.dependencia_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dependencia"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dependencia_path(conn, :create), dependencia: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dependencia"
    end
  end

  describe "edit dependencia" do
    setup [:create_dependencia]

    test "renders form for editing chosen dependencia", %{conn: conn, dependencia: dependencia} do
      conn = get(conn, Routes.dependencia_path(conn, :edit, dependencia))
      assert html_response(conn, 200) =~ "Edit Dependencia"
    end
  end

  describe "update dependencia" do
    setup [:create_dependencia]

    test "redirects when data is valid", %{conn: conn, dependencia: dependencia} do
      conn = put(conn, Routes.dependencia_path(conn, :update, dependencia), dependencia: @update_attrs)
      assert redirected_to(conn) == Routes.dependencia_path(conn, :show, dependencia)

      conn = get(conn, Routes.dependencia_path(conn, :show, dependencia))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, dependencia: dependencia} do
      conn = put(conn, Routes.dependencia_path(conn, :update, dependencia), dependencia: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dependencia"
    end
  end

  describe "delete dependencia" do
    setup [:create_dependencia]

    test "deletes chosen dependencia", %{conn: conn, dependencia: dependencia} do
      conn = delete(conn, Routes.dependencia_path(conn, :delete, dependencia))
      assert redirected_to(conn) == Routes.dependencia_path(conn, :index)
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
