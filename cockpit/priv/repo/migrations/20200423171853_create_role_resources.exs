defmodule Cockpit.Repo.Migrations.CreateRoleResources do
  use Ecto.Migration

  def change do
    create table(:role_resources) do
      add :resource_ident, :string
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end

    create index(:role_resources, [:role_id])
  end
end
