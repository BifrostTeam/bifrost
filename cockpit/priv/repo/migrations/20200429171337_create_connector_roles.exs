defmodule Cockpit.Repo.Migrations.CreateConnectorRoles do
  use Ecto.Migration

  def change do
    create table(:connector_roles) do
      add :role_id, references(:roles, on_delete: :nothing)
      add :connector_id, references(:connectors, on_delete: :nothing)

      timestamps()
    end

    create index(:connector_roles, [:role_id])
    create index(:connector_roles, [:connector_id])
  end
end
