defmodule Catalogos.ApiDepesTest do
  use Catalogos.DataCase

  alias Catalogos.ApiDepes

  describe "dependencias" do
    alias Catalogos.ApiDepes.ApiDependencias

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def api_dependencias_fixture(attrs \\ %{}) do
      {:ok, api_dependencias} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ApiDepes.create_api_dependencias()

      api_dependencias
    end

    test "list_dependencias/0 returns all dependencias" do
      api_dependencias = api_dependencias_fixture()
      assert ApiDepes.list_dependencias() == [api_dependencias]
    end

    test "get_api_dependencias!/1 returns the api_dependencias with given id" do
      api_dependencias = api_dependencias_fixture()
      assert ApiDepes.get_api_dependencias!(api_dependencias.id) == api_dependencias
    end

    test "create_api_dependencias/1 with valid data creates a api_dependencias" do
      assert {:ok, %ApiDependencias{} = api_dependencias} = ApiDepes.create_api_dependencias(@valid_attrs)
    end

    test "create_api_dependencias/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApiDepes.create_api_dependencias(@invalid_attrs)
    end

    test "update_api_dependencias/2 with valid data updates the api_dependencias" do
      api_dependencias = api_dependencias_fixture()
      assert {:ok, %ApiDependencias{} = api_dependencias} = ApiDepes.update_api_dependencias(api_dependencias, @update_attrs)
    end

    test "update_api_dependencias/2 with invalid data returns error changeset" do
      api_dependencias = api_dependencias_fixture()
      assert {:error, %Ecto.Changeset{}} = ApiDepes.update_api_dependencias(api_dependencias, @invalid_attrs)
      assert api_dependencias == ApiDepes.get_api_dependencias!(api_dependencias.id)
    end

    test "delete_api_dependencias/1 deletes the api_dependencias" do
      api_dependencias = api_dependencias_fixture()
      assert {:ok, %ApiDependencias{}} = ApiDepes.delete_api_dependencias(api_dependencias)
      assert_raise Ecto.NoResultsError, fn -> ApiDepes.get_api_dependencias!(api_dependencias.id) end
    end

    test "change_api_dependencias/1 returns a api_dependencias changeset" do
      api_dependencias = api_dependencias_fixture()
      assert %Ecto.Changeset{} = ApiDepes.change_api_dependencias(api_dependencias)
    end
  end
end
