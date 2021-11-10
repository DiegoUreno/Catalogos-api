defmodule CatalogosWeb.Router do
  use CatalogosWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  pipeline :auth do
    plug Catalogos.Guardian.AuthPipeline
  end

  scope "/api", CatalogosWeb do
    pipe_through [:api, :auth]


    post "/session/refresh", SessionController, :refresh
    post "/session/refresh", SessionController, :delete

  end

  scope "/", CatalogosWeb do
    pipe_through :browser

    get "/", PageController, :index
    put "/proveedores/:id/index", ProveedorController, :activar
    patch "/proveedores/:id/index", ProveedorController, :desactivar

    put "/dependencias/:id/index", DependenciaController, :activar
    patch "/dependencias/:id/index", DependenciaController, :desactiv

    resources "/proveedores", ProveedorController
    resources "/dependencias", DependenciaController
  end

  # Other scopes may use custom stacks.
   scope "/api", CatalogosWeb do
     pipe_through :api


    post "/users", UserController, :register
    get "/session/new", SessionController, :index
    post "/session/new", SessionController, :new

     resources "/dependencias", ApiDependenciasController, except: [:new, :edit]
     resources "/proveedores", ApiProveedoresController, except: [:new, :edit]
   end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: CatalogosWeb.Telemetry
    end
  end
end
