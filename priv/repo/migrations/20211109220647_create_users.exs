defmodule Catalogos.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nombre, :string
      add :email, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
