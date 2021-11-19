defmodule Catalogos.CatProveedoresTest do
  use Catalogos.DataCase

  alias Catalogos.CatProveedores

  describe "proveedores" do
    alias Catalogos.CatProveedores.Proveedor

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def proveedor_fixture(attrs \\ %{}) do
      {:ok, proveedor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CatProveedores.create_proveedor()

      proveedor
    end

    test "list_proveedores/0 returns all proveedores" do
      proveedor = proveedor_fixture()
      assert CatProveedores.list_proveedores() == [proveedor]
    end

    test "get_proveedor!/1 returns the proveedor with given id" do
      proveedor = proveedor_fixture()
      assert CatProveedores.get_proveedor!(proveedor.id) == proveedor
    end

    test "create_proveedor/1 with valid data creates a proveedor" do
      assert {:ok, %Proveedor{} = proveedor} = CatProveedores.create_proveedor(@valid_attrs)
    end

    test "create_proveedor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CatProveedores.create_proveedor(@invalid_attrs)
    end

    test "update_proveedor/2 with valid data updates the proveedor" do
      proveedor = proveedor_fixture()
      assert {:ok, %Proveedor{} = proveedor} = CatProveedores.update_proveedor(proveedor, @update_attrs)
    end

    test "update_proveedor/2 with invalid data returns error changeset" do
      proveedor = proveedor_fixture()
      assert {:error, %Ecto.Changeset{}} = CatProveedores.update_proveedor(proveedor, @invalid_attrs)
      assert proveedor == CatProveedores.get_proveedor!(proveedor.id)
    end

    test "delete_proveedor/1 deletes the proveedor" do
      proveedor = proveedor_fixture()
      assert {:ok, %Proveedor{}} = CatProveedores.delete_proveedor(proveedor)
      assert_raise Ecto.NoResultsError, fn -> CatProveedores.get_proveedor!(proveedor.id) end
    end

    test "change_proveedor/1 returns a proveedor changeset" do
      proveedor = proveedor_fixture()
      assert %Ecto.Changeset{} = CatProveedores.change_proveedor(proveedor)
    end
  end
end
