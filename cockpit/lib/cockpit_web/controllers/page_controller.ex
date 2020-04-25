defmodule CockpitWeb.PageController do
  use CockpitWeb, :controller

  def index(conn, _params) do
    render(conn, "login.html")
  end
end
