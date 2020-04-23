defmodule Cockpit.GameServer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_server" do
    field :server_name, :string

    timestamps()
  end

  @doc false
  def changeset(game_server, attrs) do
    game_server
    |> cast(attrs, [:server_name])
    |> validate_required([:server_name])
  end
end
