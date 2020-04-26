defmodule Cockpit.GameServers do
  @moduledoc """
  The GameServers context.
  """

  import Ecto.Query, warn: false
  alias Cockpit.Repo

  alias Cockpit.GameServers.GameServer

  @doc """
  Returns the list of game_server.

  ## Examples

      iex> list_game_server()
      [%GameServer{}, ...]

  """
  def list_game_server do
    Repo.all(GameServer)
  end

  @doc """
  Gets a single game_server.

  Raises `Ecto.NoResultsError` if the Game server does not exist.

  ## Examples

      iex> get_game_server!(123)
      %GameServer{}

      iex> get_game_server!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game_server!(id), do: Repo.get!(GameServer, id)

  @doc """
  Creates a game_server.

  ## Examples

      iex> create_game_server(%{field: value})
      {:ok, %GameServer{}}

      iex> create_game_server(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game_server(attrs \\ %{}) do
    %GameServer{}
    |> GameServer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game_server.

  ## Examples

      iex> update_game_server(game_server, %{field: new_value})
      {:ok, %GameServer{}}

      iex> update_game_server(game_server, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game_server(%GameServer{} = game_server, attrs) do
    game_server
    |> GameServer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game_server.

  ## Examples

      iex> delete_game_server(game_server)
      {:ok, %GameServer{}}

      iex> delete_game_server(game_server)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game_server(%GameServer{} = game_server) do
    Repo.delete(game_server)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game_server changes.

  ## Examples

      iex> change_game_server(game_server)
      %Ecto.Changeset{source: %GameServer{}}

  """
  def change_game_server(%GameServer{} = game_server) do
    GameServer.changeset(game_server, %{})
  end

  alias Cockpit.GameServers.GameServerAllocation

  @doc """
  Returns the list of game_server_allocations.

  ## Examples

      iex> list_game_server_allocations()
      [%GameServerAllocation{}, ...]

  """
  def list_game_server_allocations do
    Repo.all(GameServerAllocation)
  end

  @doc """
  Gets a single game_server_allocation.

  Raises `Ecto.NoResultsError` if the Game server allocation does not exist.

  ## Examples

      iex> get_game_server_allocation!(123)
      %GameServerAllocation{}

      iex> get_game_server_allocation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game_server_allocation!(id), do: Repo.get!(GameServerAllocation, id)

  @doc """
  Creates a game_server_allocation.

  ## Examples

      iex> create_game_server_allocation(%{field: value})
      {:ok, %GameServerAllocation{}}

      iex> create_game_server_allocation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game_server_allocation(attrs \\ %{}) do
    %GameServerAllocation{}
    |> GameServerAllocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game_server_allocation.

  ## Examples

      iex> update_game_server_allocation(game_server_allocation, %{field: new_value})
      {:ok, %GameServerAllocation{}}

      iex> update_game_server_allocation(game_server_allocation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game_server_allocation(%GameServerAllocation{} = game_server_allocation, attrs) do
    game_server_allocation
    |> GameServerAllocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game_server_allocation.

  ## Examples

      iex> delete_game_server_allocation(game_server_allocation)
      {:ok, %GameServerAllocation{}}

      iex> delete_game_server_allocation(game_server_allocation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game_server_allocation(%GameServerAllocation{} = game_server_allocation) do
    Repo.delete(game_server_allocation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game_server_allocation changes.

  ## Examples

      iex> change_game_server_allocation(game_server_allocation)
      %Ecto.Changeset{source: %GameServerAllocation{}}

  """
  def change_game_server_allocation(%GameServerAllocation{} = game_server_allocation) do
    GameServerAllocation.changeset(game_server_allocation, %{})
  end
end
