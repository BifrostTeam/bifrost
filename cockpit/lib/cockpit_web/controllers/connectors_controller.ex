defmodule CockpitWeb.ConnectorsController do
  use CockpitWeb, :controller

  require CockpitWeb.Auth
  alias CockpitWeb.Auth
  alias Cockpit.Connectors

  @endpoint "connectors"

  def list(conn, _params) do
    Auth.authorized conn, @endpoint, "List", "*" do
      render(conn, "connectors_list.html", %{connectors: Connectors.list_connector() |> Cockpit.Repo.preload(:allocation)})
    end
  end
end
