defmodule Cockpit.Roles.RoleResource do
  use Ecto.Schema
  import Ecto.Changeset

  schema "role_resources" do
    field :resource_ident, :string
    field :role_id, :id
    has_many :actions, Cockpit.Roles.RoleResourceAction

    timestamps()
  end

  @doc false
  def changeset(role_resource, attrs) do
    role_resource
    |> cast(attrs, [:resource_ident, :role_id])
    |> validate_required([:resource_ident, :role_id])
  end
end
