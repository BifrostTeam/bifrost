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
    |> validate_cidr
    |> unique_constraint(:cidr_prefix)
  end

  def validate_cidr(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{cidr_prefix: cidr_prefix}} ->
        if CIDR.is_cidr?(cidr_prefix) do
          changeset
        else
          add_error(changeset, :cidr_prefix, "invalid")
        end
      _ ->
        changeset
    end
  end
end
