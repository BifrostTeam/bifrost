defmodule Cockpit.Repo.Migrations.CreateConnectors do
  use Ecto.Migration

  def change do
    create table(:connectors) do
      add :host_ip, :string
      add :host_port, :integer
      add :server_name, :string

      timestamps()
    end

    create unique_index(:connectors, [:host_ip, :host_port])
  end
end
