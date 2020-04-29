defmodule Cockpit.EdgeServers do
  @moduledoc """
  The EdgeServers context.
  """

  import Ecto.Query, warn: false
  alias Cockpit.Repo

  alias Cockpit.EdgeServers.EdgeServer

  @doc """
  Returns the list of edge_servers.

  ## Examples

      iex> list_edge_servers()
      [%EdgeServer{}, ...]

  """
  def list_edge_servers do
    Repo.all(EdgeServer)
  end

  @doc """
  Gets a single edge_server.

  Raises `Ecto.NoResultsError` if the Edge server does not exist.

  ## Examples

      iex> get_edge_server!(123)
      %EdgeServer{}

      iex> get_edge_server!(456)
      ** (Ecto.NoResultsError)

  """
  def get_edge_server!(id), do: Repo.get!(EdgeServer, id)

  @doc """
  Creates a edge_server.

  ## Examples

      iex> create_edge_server(%{field: value})
      {:ok, %EdgeServer{}}

      iex> create_edge_server(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_edge_server(attrs \\ %{}) do
    %EdgeServer{}
    |> EdgeServer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a edge_server.

  ## Examples

      iex> update_edge_server(edge_server, %{field: new_value})
      {:ok, %EdgeServer{}}

      iex> update_edge_server(edge_server, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_edge_server(%EdgeServer{} = edge_server, attrs) do
    edge_server
    |> EdgeServer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a edge_server.

  ## Examples

      iex> delete_edge_server(edge_server)
      {:ok, %EdgeServer{}}

      iex> delete_edge_server(edge_server)
      {:error, %Ecto.Changeset{}}

  """
  def delete_edge_server(%EdgeServer{} = edge_server) do
    Repo.delete(edge_server)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking edge_server changes.

  ## Examples

      iex> change_edge_server(edge_server)
      %Ecto.Changeset{source: %EdgeServer{}}

  """
  def change_edge_server(%EdgeServer{} = edge_server) do
    EdgeServer.changeset(edge_server, %{})
  end
end
