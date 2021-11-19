defmodule Catalogos.CatDependencias do
  @moduledoc """
  The CatDependencias context.
  """

  import Ecto.Query, warn: false
  alias Catalogos.Repo

  alias Catalogos.CatDependencias.Dependencia

  @doc """
  Returns the list of dependencias.

  ## Examples

      iex> list_dependencias()
      [%Dependencia{}, ...]

  """
  def list_dependencias do
    Repo.all(Dependencia)
  end

  @doc """
  Gets a single dependencia.

  Raises `Ecto.NoResultsError` if the Dependencia does not exist.

  ## Examples

      iex> get_dependencia!(123)
      %Dependencia{}

      iex> get_dependencia!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dependencia!(id), do: Repo.get!(Dependencia, id)

  @doc """
  Creates a dependencia.

  ## Examples

      iex> create_dependencia(%{field: value})
      {:ok, %Dependencia{}}

      iex> create_dependencia(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dependencia(attrs \\ %{}) do
    %Dependencia{}
    |> Dependencia.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dependencia.

  ## Examples

      iex> update_dependencia(dependencia, %{field: new_value})
      {:ok, %Dependencia{}}

      iex> update_dependencia(dependencia, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dependencia(%Dependencia{} = dependencia, attrs) do
    dependencia
    |> Dependencia.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dependencia.

  ## Examples

      iex> delete_dependencia(dependencia)
      {:ok, %Dependencia{}}

      iex> delete_dependencia(dependencia)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dependencia(%Dependencia{} = dependencia) do
    Repo.delete(dependencia)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dependencia changes.

  ## Examples

      iex> change_dependencia(dependencia)
      %Ecto.Changeset{data: %Dependencia{}}

  """
  def change_dependencia(%Dependencia{} = dependencia, attrs \\ %{}) do
    Dependencia.changeset(dependencia, attrs)
  end
end
