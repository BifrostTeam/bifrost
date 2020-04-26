defmodule Cockpit.Repo.Migrations.CreateGameServerAllocations do
  use Ecto.Migration

  def change do
    create table(:game_server_allocations) do
      add :game_server_id, references(:game_server, on_delete: :nothing)
      add :allocation_address_id, references(:allocation_address, on_delete: :nothing)

      timestamps()
    end

    create index(:game_server_allocations, [:game_server_id])
    create index(:game_server_allocations, [:allocation_address_id])
  end
end
