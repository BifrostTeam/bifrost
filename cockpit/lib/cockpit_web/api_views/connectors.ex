defmodule CockpitWeb.API.ConnectorsView do
  use CockpitWeb, :view
  def render("connector.json", %{connector: connector}) do
    %{
      id: connector.id,
      name: connector.server_name,
      port: connector.host_port,
      ip: connector.host_ip
    }
  end

  def render("connectors.json", %{connectors: connectors} = _params) do
    render_many(connectors, __MODULE__, "connector.json", as: :connector)
  end
end
