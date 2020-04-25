defmodule Cockpit.Allocations.Allocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "allocation_prefix" do
    field :cidr_prefix, :string
    has_many :addresses, Cockpit.Allocations.AllocationAddress

    timestamps()
  end

  @doc false
  def changeset(allocation, attrs) do
    allocation
    |> cast(attrs, [:cidr_prefix])
    |> validate_required([:cidr_prefix])
    |> unique_constraint(:cidr_prefix)
  end
end
