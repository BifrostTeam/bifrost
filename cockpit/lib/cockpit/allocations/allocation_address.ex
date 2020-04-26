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
    |> validate_in_cidr
    |> unique_constraint(:address)
  end

  def validate_in_cidr(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{address: address}} ->
        allocation_id = fetch_change!(changeset, :allocation_id)
        allocation = Cockpit.Repo.get!(Cockpit.Allocations.Allocation, allocation_id)
        case CIDR.match(CIDR.parse(allocation.cidr_prefix), address) do
          {:ok, true} -> changeset
          _ -> add_error(changeset, :address, "not in cidr prefix")
        end
      _ -> changeset
    end
  end
end
