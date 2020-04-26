defmodule CockpitWeb.GameServerController do
  use CockpitWeb, :controller

  require CockpitWeb.Auth
  alias CockpitWeb.Auth
  alias Cockpit.GameServers

  @endpoint "gameservers"

  def list(conn, _params) do
    Auth.authorized conn, @endpoint, "List", "*" do
      render(conn, "game_server_list.html", %{game_servers: GameServers.list_game_server()})
    end
  end
end
