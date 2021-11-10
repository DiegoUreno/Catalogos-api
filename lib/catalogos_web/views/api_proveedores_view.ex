defmodule CatalogosWeb.ApiProveedoresView do
  use CatalogosWeb, :view
  alias CatalogosWeb.ApiProveedoresView

  def render("index.json", %{proveedores: proveedores}) do
    %{data: render_many(proveedores, ApiProveedoresView, "api_proveedores.json")}
  end

  def render("show.json", %{api_proveedores: api_proveedores}) do
    %{data: render_one(api_proveedores, ApiProveedoresView, "api_proveedores.json")}
  end

  def render("api_proveedores.json", %{api_proveedores: api_proveedores}) do
    %{id: api_proveedores.id,
      nombre: api_proveedores.nombre,
      rfc: api_proveedores.rfc,
      tipo: api_proveedores.tipo,
      vigente: api_proveedores.vigente,
      fechaVigencia: api_proveedores.fechaVigencia,
      representanteLegal: api_proveedores.representanteLegal,
      activo: api_proveedores.activo,
      procedencia: api_proveedores.procedencia,
      cedula: api_proveedores.cedula,
      domicilio: api_proveedores.domicilio,
      telefono: api_proveedores.telefono,
  }
  end
end
