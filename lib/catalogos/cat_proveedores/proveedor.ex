defmodule Catalogos.CatProveedores.Proveedor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "proveedores" do
    field :activo, :integer
    field :cedula, :string
    field :domicilio, :string
    field :fechaVigencia, :string
    field :nombre, :string
    field :procedencia, :string
    field :representanteLegal, :string
    field :rfc, :string
    field :telefono, :string
    field :tipo, :string
    field :vigente, :integer

    timestamps()
  end

  @doc false
  def changeset(proveedores, attrs) do
    proveedores
    |> cast(attrs, [:nombre, :rfc, :tipo, :vigente, :fechaVigencia, :representanteLegal, :activo, :procedencia, :cedula, :domicilio, :telefono])
    |> validate_required([:nombre, :rfc])
  end
end
