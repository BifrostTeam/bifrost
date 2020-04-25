defmodule CockpitWeb.DashboardController do
  use CockpitWeb, :controller
  require CockpitWeb.Auth
  alias CockpitWeb.Auth

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
