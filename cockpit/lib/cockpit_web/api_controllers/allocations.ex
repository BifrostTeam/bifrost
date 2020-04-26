defmodule CockpitWeb.API.AllocationsController do
  use CockpitWeb, :controller

  require CockpitWeb.Auth
  require Logger
  alias CockpitWeb.Auth

  @endpoint "allocations"

  def list_allocations(conn, _params) do
    Auth.authorized conn, @endpoint, "List", "*" do
      render(conn, "allocations.json", %{allocations: Cockpit.Allocations.list_allocation_prefix()})
    end
  end
end
