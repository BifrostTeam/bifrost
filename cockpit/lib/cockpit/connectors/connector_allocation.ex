defmodule Cockpit.Connectors.ConnectorAllocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "connector_allocations" do
    belongs_to :allocation_address, Cockpit.Allocations.AllocationAddress
    belongs_to :connector, Cockpit.Connectors.Connector

    timestamps()
  end

  @doc false
  def changeset(connector_allocation, attrs) do
    connector_allocation
    |> cast(attrs, [:connector_id, :allocation_address_id])
    |> validate_required([:connector_id, :allocation_address_id])
  end
end
