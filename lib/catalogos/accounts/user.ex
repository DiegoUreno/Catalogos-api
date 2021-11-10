defmodule Catalogos.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :nombre, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nombre, :email, :password])
    |> validate_required([:nombre, :email, :password])
    |> unique_constraint(:email)
  end
end
