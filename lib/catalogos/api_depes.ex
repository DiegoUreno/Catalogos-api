defmodule Catalogos.ApiDepes do
  @moduledoc """
  The ApiDepes context.
  """

  import Ecto.Query, warn: false
  alias Catalogos.Repo

  alias Catalogos.ApiDepes.ApiDependencias

  @doc """
  Returns the list of dependencias.

  ## Examples

      iex> list_dependencias()
      [%ApiDependencias{}, ...]

  """
  def list_dependencias do
    Repo.all(ApiDependencias)
  end

  @doc """
  Gets a single api_dependencias.

  Raises `Ecto.NoResultsError` if the Api dependencias does not exist.

  ## Examples

      iex> get_api_dependencias!(123)
      %ApiDependencias{}

      iex> get_api_dependencias!(456)
      ** (Ecto.NoResultsError)

  """
  def get_api_dependencias!(id), do: Repo.get!(ApiDependencias, id)

  @doc """
  Creates a api_dependencias.

  ## Examples

      iex> create_api_dependencias(%{field: value})
      {:ok, %ApiDependencias{}}

      iex> create_api_dependencias(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_api_dependencias(attrs \\ %{}) do
    %ApiDependencias{}
    |> ApiDependencias.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a api_dependencias.

  ## Examples

      iex> update_api_dependencias(api_dependencias, %{field: new_value})
      {:ok, %ApiDependencias{}}

      iex> update_api_dependencias(api_dependencias, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_api_dependencias(%ApiDependencias{} = api_dependencias, attrs) do
    api_dependencias
    |> ApiDependencias.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a api_dependencias.

  ## Examples

      iex> delete_api_dependencias(api_dependencias)
      {:ok, %ApiDependencias{}}

      iex> delete_api_dependencias(api_dependencias)
      {:error, %Ecto.Changeset{}}

  """
  def delete_api_dependencias(%ApiDependencias{} = api_dependencias) do
    Repo.delete(api_dependencias)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking api_dependencias changes.

  ## Examples

      iex> change_api_dependencias(api_dependencias)
      %Ecto.Changeset{data: %ApiDependencias{}}

  """
  def change_api_dependencias(%ApiDependencias{} = api_dependencias, attrs \\ %{}) do
    ApiDependencias.changeset(api_dependencias, attrs)
  end
end
