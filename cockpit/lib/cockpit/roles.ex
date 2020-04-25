defmodule Cockpit.Roles do
  @moduledoc """
  The Roles context.
  """

  import Ecto.Query, warn: false
  alias Cockpit.Repo

  alias Cockpit.Roles.Role

  @doc """
  Returns the list of roles.

  ## Examples

      iex> list_roles()
      [%Role{}, ...]

  """
  def list_roles do
    Repo.all(Role)
  end

  @doc """
  Gets a single role.

  Raises `Ecto.NoResultsError` if the Role does not exist.

  ## Examples

      iex> get_role!(123)
      %Role{}

      iex> get_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role!(id), do: Repo.get!(Role, id)

  @doc """
  Creates a role.

  ## Examples

      iex> create_role(%{field: value})
      {:ok, %Role{}}

      iex> create_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role.

  ## Examples

      iex> update_role(role, %{field: new_value})
      {:ok, %Role{}}

      iex> update_role(role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role.

  ## Examples

      iex> delete_role(role)
      {:ok, %Role{}}

      iex> delete_role(role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role changes.

  ## Examples

      iex> change_role(role)
      %Ecto.Changeset{source: %Role{}}

  """
  def change_role(%Role{} = role) do
    Role.changeset(role, %{})
  end

  alias Cockpit.Roles.RoleResource

  @doc """
  Returns the list of role_resources.

  ## Examples

      iex> list_role_resources()
      [%RoleResource{}, ...]

  """
  def list_role_resources do
    Repo.all(RoleResource)
  end

  @doc """
  Gets a single role_resource.

  Raises `Ecto.NoResultsError` if the Role resource does not exist.

  ## Examples

      iex> get_role_resource!(123)
      %RoleResource{}

      iex> get_role_resource!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role_resource!(id), do: Repo.get!(RoleResource, id)

  @doc """
  Creates a role_resource.

  ## Examples

      iex> create_role_resource(%{field: value})
      {:ok, %RoleResource{}}

      iex> create_role_resource(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role_resource(attrs \\ %{}) do
    %RoleResource{}
    |> RoleResource.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role_resource.

  ## Examples

      iex> update_role_resource(role_resource, %{field: new_value})
      {:ok, %RoleResource{}}

      iex> update_role_resource(role_resource, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role_resource(%RoleResource{} = role_resource, attrs) do
    role_resource
    |> RoleResource.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role_resource.

  ## Examples

      iex> delete_role_resource(role_resource)
      {:ok, %RoleResource{}}

      iex> delete_role_resource(role_resource)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role_resource(%RoleResource{} = role_resource) do
    Repo.delete(role_resource)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role_resource changes.

  ## Examples

      iex> change_role_resource(role_resource)
      %Ecto.Changeset{source: %RoleResource{}}

  """
  def change_role_resource(%RoleResource{} = role_resource) do
    RoleResource.changeset(role_resource, %{})
  end

  alias Cockpit.Roles.RoleResourceAction

  @doc """
  Returns the list of role_actions.

  ## Examples

      iex> list_role_actions()
      [%RoleResourceAction{}, ...]

  """
  def list_role_actions do
    Repo.all(RoleResourceAction)
  end

  @doc """
  Gets a single role_resource_action.

  Raises `Ecto.NoResultsError` if the Role resource action does not exist.

  ## Examples

      iex> get_role_resource_action!(123)
      %RoleResourceAction{}

      iex> get_role_resource_action!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role_resource_action!(id), do: Repo.get!(RoleResourceAction, id)

  @doc """
  Creates a role_resource_action.

  ## Examples

      iex> create_role_resource_action(%{field: value})
      {:ok, %RoleResourceAction{}}

      iex> create_role_resource_action(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role_resource_action(attrs \\ %{}) do
    %RoleResourceAction{}
    |> RoleResourceAction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role_resource_action.

  ## Examples

      iex> update_role_resource_action(role_resource_action, %{field: new_value})
      {:ok, %RoleResourceAction{}}

      iex> update_role_resource_action(role_resource_action, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role_resource_action(%RoleResourceAction{} = role_resource_action, attrs) do
    role_resource_action
    |> RoleResourceAction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role_resource_action.

  ## Examples

      iex> delete_role_resource_action(role_resource_action)
      {:ok, %RoleResourceAction{}}

      iex> delete_role_resource_action(role_resource_action)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role_resource_action(%RoleResourceAction{} = role_resource_action) do
    Repo.delete(role_resource_action)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role_resource_action changes.

  ## Examples

      iex> change_role_resource_action(role_resource_action)
      %Ecto.Changeset{source: %RoleResourceAction{}}

  """
  def change_role_resource_action(%RoleResourceAction{} = role_resource_action) do
    RoleResourceAction.changeset(role_resource_action, %{})
  end

  def get_policy_document(role_id) do
    Repo.one(from r in Role, where: r.id == ^role_id, preload: [:resources, resources: :actions])
  end

  alias Cockpit.Roles.ApiKey

  @doc """
  Returns the list of role_keys.

  ## Examples

      iex> list_role_keys()
      [%ApiKey{}, ...]

  """
  def list_role_keys do
    Repo.all(ApiKey)
  end

  @doc """
  Gets a single api_key.

  Raises `Ecto.NoResultsError` if the Api key does not exist.

  ## Examples

      iex> get_api_key!(123)
      %ApiKey{}

      iex> get_api_key!(456)
      ** (Ecto.NoResultsError)

  """
  def get_api_key!(id), do: Repo.one!(from k in ApiKey, where: k.key_id == ^id)

  @doc """
  Gets a single api_key

  Returns `nil` if the API key does not exist.
  """
  def get_api_key(key_id), do: Repo.one(from k in ApiKey, where: k.key_id == ^key_id)

  @doc """
  Creates a api_key.

  ## Examples

      iex> create_api_key(%{field: value})
      {:ok, %ApiKey{}}

      iex> create_api_key(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_api_key(attrs \\ %{}) do
    %ApiKey{}
    |> ApiKey.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a api_key.

  ## Examples

      iex> update_api_key(api_key, %{field: new_value})
      {:ok, %ApiKey{}}

      iex> update_api_key(api_key, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_api_key(%ApiKey{} = api_key, attrs) do
    api_key
    |> ApiKey.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a api_key.

  ## Examples

      iex> delete_api_key(api_key)
      {:ok, %ApiKey{}}

      iex> delete_api_key(api_key)
      {:error, %Ecto.Changeset{}}

  """
  def delete_api_key(%ApiKey{} = api_key) do
    Repo.delete(api_key)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking api_key changes.

  ## Examples

      iex> change_api_key(api_key)
      %Ecto.Changeset{source: %ApiKey{}}

  """
  def change_api_key(%ApiKey{} = api_key) do
    ApiKey.changeset(api_key, %{})
  end
end
