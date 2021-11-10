defmodule Catalogos.Repo.Migrations.Dependencias do
  use Ecto.Migration

  def change do
    create table(:Dependencias) do

      add :nombre, :string, null: false
      add :numero, :integer, null: false
      add :abreviatura, :string, size: 50, default: nil
      add :sector, :integer, size: 11, default: nil
      add :activo, :integer, default: 1
      add :tipo, :integer, size: 1, default: nil
      add :telefono, :string, size: 50, default: nil
      add :fax, :string, size: 50, default: nil
      add :domicilio, :string, default: nil
      add :email, :string, default: nil
      add :administrativo, :string, default: nil


      timestamps()
    end
  end
end
