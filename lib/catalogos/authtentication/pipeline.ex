defmodule Catalogos.Guardian.AuthPipeline do
  @claims %{typ: "access"}

  use Guardian.Plug.Pipeline,
      otps_app: :catalogos,
      module: Catalogos.Guardian,
      error_handler: Catalogos.Guardian.AuthErrorHandler


      plug(Guardian.Plug.VerifyHeader, claims: @claims, realm: "Bearer")
      plug(Guardian.Plug.EnsureAuthenticated)
      plug(Guardian.Plug.LoadResource, ensure: true)

    end
