defmodule Cockpit.Repo.Migrations.CreateRoleActions do
  use Ecto.Migration

  def change do
    create table(:role_actions) do
      add :action, :string
      add :effect, :string
      add :role_resource_id, references(:role_resources, on_delete: :nothing)

      timestamps()
    end

    create index(:role_actions, [:role_resource_id])
  end
end
