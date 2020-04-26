defmodule Cockpit.GameServers.GameServer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_server" do
    field :host_ip, :string
    field :host_port, :integer
    field :server_name, :string
    has_one :allocation_address, Cockpit.GameServers.GameServerAllocation
    has_one :allocation, through: [:allocation_address, :allocation_address]

    timestamps()
  end

  @doc false
  def changeset(game_server, attrs) do
    game_server
    |> cast(attrs, [:host_ip, :host_port, :server_name])
    |> validate_required([:host_ip, :host_port, :server_name])
    |> unique_constraint([:host_ip, :host_port])
  end
end
