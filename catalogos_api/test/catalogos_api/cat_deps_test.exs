defmodule CatalogosApi.CatDepsTest do
  use CatalogosApi.DataCase

  alias CatalogosApi.CatDeps

  describe "dependencias" do
    alias CatalogosApi.CatDeps.Dependencia

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def dependencia_fixture(attrs \\ %{}) do
      {:ok, dependencia} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CatDeps.create_dependencia()

      dependencia
    end

    test "list_dependencias/0 returns all dependencias" do
      dependencia = dependencia_fixture()
      assert CatDeps.list_dependencias() == [dependencia]
    end

    test "get_dependencia!/1 returns the dependencia with given id" do
      dependencia = dependencia_fixture()
      assert CatDeps.get_dependencia!(dependencia.id) == dependencia
    end

    test "create_dependencia/1 with valid data creates a dependencia" do
      assert {:ok, %Dependencia{} = dependencia} = CatDeps.create_dependencia(@valid_attrs)
    end

    test "create_dependencia/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CatDeps.create_dependencia(@invalid_attrs)
    end

    test "update_dependencia/2 with valid data updates the dependencia" do
      dependencia = dependencia_fixture()
      assert {:ok, %Dependencia{} = dependencia} = CatDeps.update_dependencia(dependencia, @update_attrs)
    end

    test "update_dependencia/2 with invalid data returns error changeset" do
      dependencia = dependencia_fixture()
      assert {:error, %Ecto.Changeset{}} = CatDeps.update_dependencia(dependencia, @invalid_attrs)
      assert dependencia == CatDeps.get_dependencia!(dependencia.id)
    end

    test "delete_dependencia/1 deletes the dependencia" do
      dependencia = dependencia_fixture()
      assert {:ok, %Dependencia{}} = CatDeps.delete_dependencia(dependencia)
      assert_raise Ecto.NoResultsError, fn -> CatDeps.get_dependencia!(dependencia.id) end
    end

    test "change_dependencia/1 returns a dependencia changeset" do
      dependencia = dependencia_fixture()
      assert %Ecto.Changeset{} = CatDeps.change_dependencia(dependencia)
    end
  end
end
