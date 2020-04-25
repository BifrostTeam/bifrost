defmodule Cockpit.Allocations.AllocationAddress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "allocation_address" do
    field :address, :string
    field :allocation_id, :id

    timestamps()
  end

  @doc false
  def changeset(allocation_address, attrs) do
    allocation_address
    |> cast(attrs, [:address, :allocation_id])
    |> validate_required([:address, :allocation_id])
    |> unique_constraint(:address)
  end
end
