defmodule Catalogos.Repo.Migrations.CreateProveedores do
  use Ecto.Migration

  def change do
    create table(:Proveedores) do

      add :nombre, :string, null: false
      add :rfc, :string, default: nil, size: 13
      add :tipo, :string, default: nil
      add :vigente, :integer, default: 1
      add :fechaVigencia, :string, default: 1
      add :representanteLegal, :string, default: nil
      add :activo, :integer, default: 1
      add :procedencia, :string, default: nil
      add :cedula, :string, default: nil
      add :domicilio, :string, default: nil
      add :telefono,  :string, size: 50, default: nil

      timestamps()
    end
  end
end
