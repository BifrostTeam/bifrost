defmodule Cockpit.Repo.Migrations.CreateGameServer do
  use Ecto.Migration

  def change do
    create table(:game_server) do
      add :host_ip, :string
      add :host_port, :integer
      add :server_name, :string

      timestamps()
    end

    create unique_index(:game_server, [:host_ip, :host_port])
  end
end
