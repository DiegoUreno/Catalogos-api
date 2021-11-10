defmodule Catalogos.ApiProvs do
  @moduledoc """
  The ApiProvs context.
  """

  import Ecto.Query, warn: false
  alias Catalogos.Repo

  alias Catalogos.ApiProvs.ApiProveedores

  @doc """
  Returns the list of proveedores.

  ## Examples

      iex> list_proveedores()
      [%ApiProveedores{}, ...]

  """
  def list_proveedores do
    Repo.all(ApiProveedores)
  end

  @doc """
  Gets a single api_proveedores.

  Raises `Ecto.NoResultsError` if the Api proveedores does not exist.

  ## Examples

      iex> get_api_proveedores!(123)
      %ApiProveedores{}

      iex> get_api_proveedores!(456)
      ** (Ecto.NoResultsError)

  """
  def get_api_proveedores!(id), do: Repo.get!(ApiProveedores, id)

  @doc """
  Creates a api_proveedores.

  ## Examples

      iex> create_api_proveedores(%{field: value})
      {:ok, %ApiProveedores{}}

      iex> create_api_proveedores(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_api_proveedores(attrs \\ %{}) do
    %ApiProveedores{}
    |> ApiProveedores.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a api_proveedores.

  ## Examples

      iex> update_api_proveedores(api_proveedores, %{field: new_value})
      {:ok, %ApiProveedores{}}

      iex> update_api_proveedores(api_proveedores, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_api_proveedores(%ApiProveedores{} = api_proveedores, attrs) do
    api_proveedores
    |> ApiProveedores.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a api_proveedores.

  ## Examples

      iex> delete_api_proveedores(api_proveedores)
      {:ok, %ApiProveedores{}}

      iex> delete_api_proveedores(api_proveedores)
      {:error, %Ecto.Changeset{}}

  """
  def delete_api_proveedores(%ApiProveedores{} = api_proveedores) do
    Repo.delete(api_proveedores)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking api_proveedores changes.

  ## Examples

      iex> change_api_proveedores(api_proveedores)
      %Ecto.Changeset{data: %ApiProveedores{}}

  """
  def change_api_proveedores(%ApiProveedores{} = api_proveedores, attrs \\ %{}) do
    ApiProveedores.changeset(api_proveedores, attrs)
  end
end
