defmodule CatalogosWeb.ApiDependenciasView do
  use CatalogosWeb, :view
  alias CatalogosWeb.ApiDependenciasView

  def render("index.json", %{dependencias: dependencias}) do
    %{data: render_many(dependencias, ApiDependenciasView, "api_dependencias.json")}
  end

  def render("show.json", %{api_dependencias: api_dependencias}) do
    %{data: render_one(api_dependencias, ApiDependenciasView, "api_dependencias.json")}
  end

  def render("api_dependencias.json", %{api_dependencias: api_dependencias}) do
  %{id: api_dependencias.id,
      nombre: api_dependencias.nombre,
      numero: api_dependencias.numero,
      abreviatura: api_dependencias.abreviatura,
      sector: api_dependencias.sector,
      tipo: api_dependencias.tipo,
      telefono: api_dependencias.telefono,
      fax:  api_dependencias.fax,
      domicilio: api_dependencias.domicilio,
      email: api_dependencias.email,
      administrativo: api_dependencias.administrativo
    }
  end
end
