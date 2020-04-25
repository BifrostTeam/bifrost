defmodule CockpitWeb.Auth.AuthorizationError do
  defexception [:message, plug_status: 401]
end
