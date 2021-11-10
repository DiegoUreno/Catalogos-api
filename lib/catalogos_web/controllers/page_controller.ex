defmodule CatalogosWeb.PageController do
  use CatalogosWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
