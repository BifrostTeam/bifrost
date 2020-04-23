defmodule Cockpit.Repo.Migrations.CreateRoleKeys do
  use Ecto.Migration

  def change do
    create table(:role_keys) do
      add :key_id, :string
      add :key, :string
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:role_keys, [:key_id])
    create index(:role_keys, [:role_id])
  end
end
