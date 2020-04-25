defmodule Cockpit.Repo.Migrations.CreateAllocationAddress do
  use Ecto.Migration

  def change do
    create table(:allocation_address) do
      add :address, :string
      add :allocation_id, references(:allocation_prefix, on_delete: :nothing)

      timestamps()
    end

    create index(:allocation_address, [:allocation_id])
    create unique_index(:allocation_address, [:address])
  end
end
