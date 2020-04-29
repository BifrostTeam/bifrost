defmodule Cockpit.Repo.Migrations.CreateEdgeServers do
  use Ecto.Migration

  def change do
    create table(:edge_servers) do
      add :server_name, :string
      add :server_address, :string

      timestamps()
    end

    create unique_index(:edge_servers, [:server_name])
    create unique_index(:edge_servers, [:server_address])
  end
end
