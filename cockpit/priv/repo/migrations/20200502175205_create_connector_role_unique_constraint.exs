defmodule Cockpit.Repo.Migrations.CreateConnectorRoleUniqueConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:connector_roles, [:role_id, :connector_id])
  end
end
