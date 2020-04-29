defmodule Cockpit.Repo.Migrations.ConnectorAllocations do
  use Ecto.Migration

  def change do
    create table(:connector_allocations) do
      add :connector_id, references(:connectors, on_delete: :nothing)
      add :allocation_address_id, references(:allocation_address, on_delete: :nothing)

      timestamps()
    end

    create index(:connector_allocations, [:connector_id])
    create index(:connector_allocations, [:allocation_address_id])
  end
end
