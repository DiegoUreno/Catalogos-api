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
  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:nombre, :email, :password])
    |> validate_required([:nombre, :email, :password])
    |> unique_constraint(:email)
    |> encrypt_and_put_password()
  end
  defp encrypt_and_put_password(user) do
    with password <- fetch_field!(user, :password) do
      encrypted_password = Bcrypt.Base.hash_password(password, Bcrypt.gen_salt(12,true))
      put_change(user, :password, encrypted_password)
    end
  end
end
