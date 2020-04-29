defmodule CockpitWeb.API.ConnectorsController do
  use CockpitWeb, :controller

  require CockpitWeb.Auth
  require Logger
  alias CockpitWeb.Auth

  @endpoint "connectors"

  def list_connectors(conn, _params) do
    Auth.authorized conn, @endpoint, "List", "*" do
      render(conn, "connectors.json", %{connectors: Cockpit.Connectors.list_connector()})
    end
  end

  def get_connector_info(conn, %{"server_id" => server_id}) do
    Auth.authorized conn, @endpoint, "GetInfo", server_id do
      render(conn, "connector.json", %{connector: Cockpit.Connectors.get_connector!(server_id)})
    end
  end
end
