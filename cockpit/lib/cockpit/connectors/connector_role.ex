defmodule Cockpit.Connectors.ConnectorRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "connector_roles" do
    belongs_to :role, Cockpit.Roles.Role
    belongs_to :connector, Cockpit.Connectors.Connector

    timestamps()
  end

  @doc false
  def changeset(connector_role, attrs) do
    connector_role
    |> cast(attrs, [:role_id, :connector_id])
    |> validate_required([:role_id, :connector_id])
    |> unique_constraint([:role_id, :connector_id])
  end
end
