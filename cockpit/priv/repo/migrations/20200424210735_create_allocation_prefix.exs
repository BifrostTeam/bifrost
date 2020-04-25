defmodule Cockpit.Repo.Migrations.CreateAllocationPrefix do
  use Ecto.Migration

  def change do
    create table(:allocation_prefix) do
      add :cidr_prefix, :string

      timestamps()
    end

    create unique_index(:allocation_prefix, [:cidr_prefix])
  end
end
