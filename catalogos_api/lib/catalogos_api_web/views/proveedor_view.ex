defmodule CatalogosApiWeb.ProveedorView do
  use CatalogosApiWeb, :view
  alias CatalogosApiWeb.ProveedorView

  def render("index.json", %{proveedores: proveedores}) do
    %{data: render_many(proveedores, ProveedorView, "proveedor.json")}
  end

  def render("show.json", %{proveedor: proveedor}) do
    %{data: render_one(proveedor, ProveedorView, "proveedor.json")}
  end

  def render("proveedor.json", %{proveedor: proveedor}) do
    %{id: proveedor.id,
      nombre: proveedor.nombre,
      rfc: proveedor.rfc,
      tipo: proveedor.tipo,
      vigente: proveedor.vigente,
      fechaVigencia: proveedor.fechaVigencia,
      representanteLegal: proveedor.representanteLegal,
      activo: proveedor.activo,
      procedencia: proveedor.procedencia,
      cedula: proveedor.cedula,
      domicilio: proveedor.domicilio,
      telefono: proveedor.telefono,
  }
  end
end
