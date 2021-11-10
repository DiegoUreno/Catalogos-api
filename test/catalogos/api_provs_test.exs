defmodule Catalogos.ApiProvsTest do
  use Catalogos.DataCase

  alias Catalogos.ApiProvs

  describe "proveedores" do
    alias Catalogos.ApiProvs.ApiProveedores

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def api_proveedores_fixture(attrs \\ %{}) do
      {:ok, api_proveedores} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ApiProvs.create_api_proveedores()

      api_proveedores
    end

    test "list_proveedores/0 returns all proveedores" do
      api_proveedores = api_proveedores_fixture()
      assert ApiProvs.list_proveedores() == [api_proveedores]
    end

    test "get_api_proveedores!/1 returns the api_proveedores with given id" do
      api_proveedores = api_proveedores_fixture()
      assert ApiProvs.get_api_proveedores!(api_proveedores.id) == api_proveedores
    end

    test "create_api_proveedores/1 with valid data creates a api_proveedores" do
      assert {:ok, %ApiProveedores{} = api_proveedores} = ApiProvs.create_api_proveedores(@valid_attrs)
    end

    test "create_api_proveedores/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApiProvs.create_api_proveedores(@invalid_attrs)
    end

    test "update_api_proveedores/2 with valid data updates the api_proveedores" do
      api_proveedores = api_proveedores_fixture()
      assert {:ok, %ApiProveedores{} = api_proveedores} = ApiProvs.update_api_proveedores(api_proveedores, @update_attrs)
    end

    test "update_api_proveedores/2 with invalid data returns error changeset" do
      api_proveedores = api_proveedores_fixture()
      assert {:error, %Ecto.Changeset{}} = ApiProvs.update_api_proveedores(api_proveedores, @invalid_attrs)
      assert api_proveedores == ApiProvs.get_api_proveedores!(api_proveedores.id)
    end

    test "delete_api_proveedores/1 deletes the api_proveedores" do
      api_proveedores = api_proveedores_fixture()
      assert {:ok, %ApiProveedores{}} = ApiProvs.delete_api_proveedores(api_proveedores)
      assert_raise Ecto.NoResultsError, fn -> ApiProvs.get_api_proveedores!(api_proveedores.id) end
    end

    test "change_api_proveedores/1 returns a api_proveedores changeset" do
      api_proveedores = api_proveedores_fixture()
      assert %Ecto.Changeset{} = ApiProvs.change_api_proveedores(api_proveedores)
    end
  end
end
