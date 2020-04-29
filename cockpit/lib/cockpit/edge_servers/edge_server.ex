defmodule Cockpit.EdgeServers.EdgeServer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "edge_servers" do
    field :server_address, :string
    field :server_name, :string

    timestamps()
  end

  @doc false
  def changeset(edge_server, attrs) do
    edge_server
    |> cast(attrs, [:server_name, :server_address])
    |> validate_required([:server_name, :server_address])
    |> unique_constraint(:server_name)
    |> unique_constraint(:server_address)
  end
end
