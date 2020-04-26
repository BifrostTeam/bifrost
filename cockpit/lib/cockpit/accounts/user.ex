defmodule Cockpit.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    has_one :user_role, Cockpit.Accounts.UserRole
    has_one :role, through: [:user_role, :role]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> unique_constraint(:name)
    |> hash_password()
  end

  def hash_password(user) do
    case user do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(user, :password, Argon2.hash_pwd_salt(pass))
      _ ->
        user
    end
  end
end
