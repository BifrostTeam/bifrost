defmodule Cockpit.Repo.Migrations.CreateGameServer do
  use Ecto.Migration

  def change do
    create table(:game_server) do
      add :server_name, :string

      timestamps()
    end

  end
end
