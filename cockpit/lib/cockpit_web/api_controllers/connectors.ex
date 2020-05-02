defmodule CockpitWeb.API.ConnectorsController do
  use CockpitWeb, :controller

  require CockpitWeb.Auth
  require Logger
  alias CockpitWeb.Auth
  alias Cockpit.Connectors

  @endpoint "connectors"

  def list_connectors(conn, _params) do
    Auth.authorized conn, "List", "*" do
      render(conn, "connectors.json", %{connectors: Cockpit.Connectors.list_connector()})
    end
  end

  def get_connector_info(conn, %{"server_id" => server_id}) do
    Auth.authorized conn, "GetInfo", server_id do
      render(conn, "connector.json", %{connector: Cockpit.Connectors.get_connector!(server_id)})
    end
  end

  def get_own_info(conn, _params) do
    Auth.validate_auth conn do
      %{auth: role} = conn.assigns
      connector_role = Connectors.get_connector_role!(role.id)
      Auth.authorized conn, connector_role.connector.id, "GetInfo" do
        render(conn, "connector.json", %{connector: connector_role.connector})
      end
    end
  end
end
