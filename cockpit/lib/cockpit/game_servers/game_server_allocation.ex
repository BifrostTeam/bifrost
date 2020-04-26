defmodule Cockpit.GameServers.GameServerAllocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_server_allocations" do
    belongs_to :allocation_address, Cockpit.Allocations.AllocationAddress
    belongs_to :game_server, Cockpit.GameServers.GameServer

    timestamps()
  end

  @doc false
  def changeset(game_server_allocation, attrs) do
    game_server_allocation
    |> cast(attrs, [:game_server_id, :allocation_address_id])
    |> validate_required([:game_server_id, :allocation_address_id])
  end
end
