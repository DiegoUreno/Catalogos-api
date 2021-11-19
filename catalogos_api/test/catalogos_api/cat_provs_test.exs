defmodule CatalogosApi.CatProvsTest do
  use CatalogosApi.DataCase

  alias CatalogosApi.CatProvs

  describe "proveedores" do
    alias CatalogosApi.CatProvs.Proveedor

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def proveedor_fixture(attrs \\ %{}) do
      {:ok, proveedor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CatProvs.create_proveedor()

      proveedor
    end

    test "list_proveedores/0 returns all proveedores" do
      proveedor = proveedor_fixture()
      assert CatProvs.list_proveedores() == [proveedor]
    end

    test "get_proveedor!/1 returns the proveedor with given id" do
      proveedor = proveedor_fixture()
      assert CatProvs.get_proveedor!(proveedor.id) == proveedor
    end

    test "create_proveedor/1 with valid data creates a proveedor" do
      assert {:ok, %Proveedor{} = proveedor} = CatProvs.create_proveedor(@valid_attrs)
    end

    test "create_proveedor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CatProvs.create_proveedor(@invalid_attrs)
    end

    test "update_proveedor/2 with valid data updates the proveedor" do
      proveedor = proveedor_fixture()
      assert {:ok, %Proveedor{} = proveedor} = CatProvs.update_proveedor(proveedor, @update_attrs)
    end

    test "update_proveedor/2 with invalid data returns error changeset" do
      proveedor = proveedor_fixture()
      assert {:error, %Ecto.Changeset{}} = CatProvs.update_proveedor(proveedor, @invalid_attrs)
      assert proveedor == CatProvs.get_proveedor!(proveedor.id)
    end

    test "delete_proveedor/1 deletes the proveedor" do
      proveedor = proveedor_fixture()
      assert {:ok, %Proveedor{}} = CatProvs.delete_proveedor(proveedor)
      assert_raise Ecto.NoResultsError, fn -> CatProvs.get_proveedor!(proveedor.id) end
    end

    test "change_proveedor/1 returns a proveedor changeset" do
      proveedor = proveedor_fixture()
      assert %Ecto.Changeset{} = CatProvs.change_proveedor(proveedor)
    end
  end
end
