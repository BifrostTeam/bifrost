defmodule Cockpit.Connectors.Connector do
  use Ecto.Schema
  import Ecto.Changeset

  schema "connectors" do
    field :host_ip, :string
    field :host_port, :integer
    field :server_name, :string
    has_one :allocation_address, Cockpit.Connectors.ConnectorAllocation
    has_one :allocation, through: [:allocation_address, :allocation_address]
    has_one :connector_role, Cockpit.Connectors.ConnectorRole
    has_one :role, through: [:connector_role, :role]

    timestamps()
  end

  @doc false
  def changeset(connector, attrs) do
    connector
    |> cast(attrs, [:host_ip, :host_port, :server_name])
    |> validate_required([:host_ip, :host_port, :server_name])
    |> unique_constraint([:host_ip, :host_port])
  end
end
