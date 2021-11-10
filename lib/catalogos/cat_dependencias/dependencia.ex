defmodule Catalogos.CatDependencias.Dependencia do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dependencias" do
    field :domicilio, :string
    field :nivel, :string
    field :nombre, :string
    field :numero, :integer
    field :tipo, :integer
    field :abreviatura, :string
    field :sector, :integer
    field :activo, :integer
    field :telefono, :string
    field :fax, :string
    field :email, :string
    field :administrativo, :string
    timestamps()
  end

  def changeset(dependencias, attrs) do
    dependencias
    |> cast(attrs, [:nombre, :numero, :abreviatura, :sector, :activo, :tipo, :nivel, :telefono, :fax, :domicilio, :email, :administrativo])
    |> validate_required([:nombre, :numero, :tipo, :domicilio, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:nivel, ["", "DIR", "SEC"])
  end
end
