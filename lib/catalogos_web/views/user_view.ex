defmodule CatalogosWeb.UserView do
  use CatalogosWeb, :view
  alias CatalogosWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      nombre: user.nombre,
      email: user.email,
      password: user.password}
  end
end
