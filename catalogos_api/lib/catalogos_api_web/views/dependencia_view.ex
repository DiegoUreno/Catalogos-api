defmodule CatalogosApiWeb.DependenciaView do
  use CatalogosApiWeb, :view
  alias CatalogosApiWeb.DependenciaView

  def render("index.json", %{dependencias: dependencias}) do
    %{data: render_many(dependencias, DependenciaView, "dependencia.json")}
  end

  def render("show.json", %{dependencia: dependencia}) do
    %{data: render_one(dependencia, DependenciaView, "dependencia.json")}
  end

  def render("dependencia.json", %{dependencia: dependencia}) do
    %{id: dependencia.id,
      nombre: dependencia.nombre,
      numero: dependencia.numero,
      abreviatura: dependencia.abreviatura,
      sector: dependencia.sector,
      tipo: dependencia.tipo,
      telefono: dependencia.telefono,
      fax:  dependencia.fax,
      domicilio: dependencia.domicilio,
      email: dependencia.email,
      administrativo: dependencia.administrativo
    }
  end
end
