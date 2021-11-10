defmodule Catalogos.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Catalogos.Repo

  alias Catalogos.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
    def create_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
    end

    def get_by_email(email) do
      query = from u in User, where: u.email == ^email

      case Repo.one(query) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
      end
    end

    def get_by_id(id) do
      User |> Repo.get!(id)
    end

    def auth_user(email, password) do
      with {:ok, user} <- get_by_email(email) do
        case validate_password(password, user.password) do
          false -> {:error, :unauthorized}
          true -> {:ok, user}
        end
      end
    end

    defp validate_password(password, encrypted) do
        Bcrypt.verify_pass(password, encrypted)
    end

  end
