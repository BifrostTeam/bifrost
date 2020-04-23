defmodule Cockpit.Roles.RoleResourceAction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "role_actions" do
    field :action, :string
    field :effect, :string
    field :role_resource_id, :id

    timestamps()
  end

  @doc false
  def changeset(role_resource_action, attrs) do
    role_resource_action
    |> cast(attrs, [:action, :effect, :role_resource_id])
    |> validate_required([:action, :effect, :role_resource_id])
  end
end
