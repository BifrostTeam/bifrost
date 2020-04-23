defmodule Cockpit.Roles.ApiKey do
  use Ecto.Schema
  import Ecto.Changeset

  schema "role_keys" do
    field :key, :string
    field :key_id, :string
    field :role_id, :id

    timestamps()
  end

  @doc false
  def changeset(api_key, attrs) do
    api_key
    |> cast(attrs, [:key_id, :key, :role_id])
    |> validate_required([:key_id, :key, :role_id])
    |> unique_constraint(:key_id)
  end
end
