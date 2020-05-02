defmodule Cockpit.Connectors do
  @moduledoc """
  The Connectors context.
  """

  import Ecto.Query, warn: false
  alias Cockpit.Repo

  alias Cockpit.Connectors.Connector

  @doc """
  Returns the list of connector.

  ## Examples

      iex> list_connector()
      [%Connector{}, ...]

  """
  def list_connector do
    Repo.all(Connector)
  end

  @doc """
  Gets a single connector.

  Raises `Ecto.NoResultsError` if the Game server does not exist.

  ## Examples

      iex> get_connector!(123)
      %Connector{}

      iex> get_connector!(456)
      ** (Ecto.NoResultsError)

  """
  def get_connector!(id), do: Repo.get!(Connector, id)

  @doc """
  Creates a connector.

  ## Examples

      iex> create_connector(%{field: value})
      {:ok, %Connector{}}

      iex> create_connector(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_connector(attrs \\ %{}) do
    %Connector{}
    |> Connector.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a connector.

  ## Examples

      iex> update_connector(connector, %{field: new_value})
      {:ok, %Connector{}}

      iex> update_connector(connector, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_connector(%Connector{} = connector, attrs) do
    connector
    |> Connector.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a connector.

  ## Examples

      iex> delete_connector(connector)
      {:ok, %Connector{}}

      iex> delete_connector(connector)
      {:error, %Ecto.Changeset{}}

  """
  def delete_connector(%Connector{} = connector) do
    Repo.delete(connector)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking connector changes.

  ## Examples

      iex> change_connector(connector)
      %Ecto.Changeset{source: %Connector{}}

  """
  def change_connector(%Connector{} = connector) do
    Connector.changeset(connector, %{})
  end

  alias Cockpit.Connectors.ConnectorAllocation

  @doc """
  Returns the list of connector_allocations.

  ## Examples

      iex> list_connector_allocations()
      [%ConnectorAllocation{}, ...]

  """
  def list_connector_allocations do
    Repo.all(ConnectorAllocation)
  end

  @doc """
  Gets a single connector_allocation.

  Raises `Ecto.NoResultsError` if the Game server allocation does not exist.

  ## Examples

      iex> get_connector_allocation!(123)
      %ConnectorAllocation{}

      iex> get_connector_allocation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_connector_allocation!(id), do: Repo.get!(ConnectorAllocation, id)

  @doc """
  Creates a connector_allocation.

  ## Examples

      iex> create_connector_allocation(%{field: value})
      {:ok, %ConnectorAllocation{}}

      iex> create_connector_allocation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_connector_allocation(attrs \\ %{}) do
    %ConnectorAllocation{}
    |> ConnectorAllocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a connector_allocation.

  ## Examples

      iex> update_connector_allocation(connector_allocation, %{field: new_value})
      {:ok, %ConnectorAllocation{}}

      iex> update_connector_allocation(connector_allocation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_connector_allocation(%ConnectorAllocation{} = connector_allocation, attrs) do
    connector_allocation
    |> ConnectorAllocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a connector_allocation.

  ## Examples

      iex> delete_connector_allocation(connector_allocation)
      {:ok, %ConnectorAllocation{}}

      iex> delete_connector_allocation(connector_allocation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_connector_allocation(%ConnectorAllocation{} = connector_allocation) do
    Repo.delete(connector_allocation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking connector_allocation changes.

  ## Examples

      iex> change_connector_allocation(connector_allocation)
      %Ecto.Changeset{source: %ConnectorAllocation{}}

  """
  def change_connector_allocation(%ConnectorAllocation{} = connector_allocation) do
    ConnectorAllocation.changeset(connector_allocation, %{})
  end

  def create_default_connector_role(%Connector{} = connector) do
    self_rn = "rn:connectors:#{connector.id}"
    {:ok, role} = Cockpit.Roles.create_role(%{role_name: "connector_#{connector.id}_role"})
    {:ok, _} = create_connector_role(%{role_id: role.id, connector_id: connector.id})
    {:ok, role_resource} = Cockpit.Roles.create_role_resource(%{resource_ident: self_rn, role_id: role.id})
    {:ok, _} = Cockpit.Roles.create_role_resource_action(%{role_resource_id: role_resource.id, action: "GetInfo", effect: "allow"})

    {:ok, role_resource} = Cockpit.Roles.create_role_resource(%{resource_ident: "rn:edgeservers:*", role_id: role.id})
    {:ok, _} = Cockpit.Roles.create_role_resource_action(%{role_resource_id: role_resource.id, action: "List", effect: "allow"})

    {:ok, role}
  end

  alias Cockpit.Connectors.ConnectorRole

  def create_connector_role(attrs \\ %{}) do
    %ConnectorRole{}
    |> ConnectorRole.changeset(attrs)
    |> Repo.insert()
  end

  def get_connector_role!(role_id) do
    Repo.one!(from c in ConnectorRole, where: c.role_id == ^role_id, preload: [:connector])
  end
end
