defmodule Catalogos.CatDependenciasTest do
  use Catalogos.DataCase

  alias Catalogos.CatDependencias

  describe "dependencias" do
    alias Catalogos.CatDependencias.Dependencia

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def dependencia_fixture(attrs \\ %{}) do
      {:ok, dependencia} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CatDependencias.create_dependencia()

      dependencia
    end

    test "list_dependencias/0 returns all dependencias" do
      dependencia = dependencia_fixture()
      assert CatDependencias.list_dependencias() == [dependencia]
    end

    test "get_dependencia!/1 returns the dependencia with given id" do
      dependencia = dependencia_fixture()
      assert CatDependencias.get_dependencia!(dependencia.id) == dependencia
    end

    test "create_dependencia/1 with valid data creates a dependencia" do
      assert {:ok, %Dependencia{} = dependencia} = CatDependencias.create_dependencia(@valid_attrs)
    end

    test "create_dependencia/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CatDependencias.create_dependencia(@invalid_attrs)
    end

    test "update_dependencia/2 with valid data updates the dependencia" do
      dependencia = dependencia_fixture()
      assert {:ok, %Dependencia{} = dependencia} = CatDependencias.update_dependencia(dependencia, @update_attrs)
    end

    test "update_dependencia/2 with invalid data returns error changeset" do
      dependencia = dependencia_fixture()
      assert {:error, %Ecto.Changeset{}} = CatDependencias.update_dependencia(dependencia, @invalid_attrs)
      assert dependencia == CatDependencias.get_dependencia!(dependencia.id)
    end

    test "delete_dependencia/1 deletes the dependencia" do
      dependencia = dependencia_fixture()
      assert {:ok, %Dependencia{}} = CatDependencias.delete_dependencia(dependencia)
      assert_raise Ecto.NoResultsError, fn -> CatDependencias.get_dependencia!(dependencia.id) end
    end

    test "change_dependencia/1 returns a dependencia changeset" do
      dependencia = dependencia_fixture()
      assert %Ecto.Changeset{} = CatDependencias.change_dependencia(dependencia)
    end
  end
end
