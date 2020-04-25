defmodule Cockpit.Allocations do
  @moduledoc """
  The Allocations context.
  """

  import Ecto.Query, warn: false
  alias Cockpit.Repo

  alias Cockpit.Allocations.Allocation

  @doc """
  Returns the list of allocation_prefix.

  ## Examples

      iex> list_allocation_prefix()
      [%Allocation{}, ...]

  """
  def list_allocation_prefix do
    Repo.all(Allocation)
  end

  @doc """
  Gets a single allocation.

  Raises `Ecto.NoResultsError` if the Allocation does not exist.

  ## Examples

      iex> get_allocation!(123)
      %Allocation{}

      iex> get_allocation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_allocation!(id), do: Repo.get!(Allocation, id)

  @doc """
  Creates a allocation.

  ## Examples

      iex> create_allocation(%{field: value})
      {:ok, %Allocation{}}

      iex> create_allocation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_allocation(attrs \\ %{}) do
    %Allocation{}
    |> Allocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a allocation.

  ## Examples

      iex> update_allocation(allocation, %{field: new_value})
      {:ok, %Allocation{}}

      iex> update_allocation(allocation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_allocation(%Allocation{} = allocation, attrs) do
    allocation
    |> Allocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a allocation.

  ## Examples

      iex> delete_allocation(allocation)
      {:ok, %Allocation{}}

      iex> delete_allocation(allocation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_allocation(%Allocation{} = allocation) do
    Repo.delete(allocation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking allocation changes.

  ## Examples

      iex> change_allocation(allocation)
      %Ecto.Changeset{source: %Allocation{}}

  """
  def change_allocation(%Allocation{} = allocation) do
    Allocation.changeset(allocation, %{})
  end

  alias Cockpit.Allocations.AllocationAddress

  @doc """
  Returns the list of allocation_address.

  ## Examples

      iex> list_allocation_address()
      [%AllocationAddress{}, ...]

  """
  def list_allocation_address do
    Repo.all(AllocationAddress)
  end

  @doc """
  Gets a single allocation_address.

  Raises `Ecto.NoResultsError` if the Allocation address does not exist.

  ## Examples

      iex> get_allocation_address!(123)
      %AllocationAddress{}

      iex> get_allocation_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_allocation_address!(id), do: Repo.get!(AllocationAddress, id)

  @doc """
  Creates a allocation_address.

  ## Examples

      iex> create_allocation_address(%{field: value})
      {:ok, %AllocationAddress{}}

      iex> create_allocation_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_allocation_address(attrs \\ %{}) do
    %AllocationAddress{}
    |> AllocationAddress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a allocation_address.

  ## Examples

      iex> update_allocation_address(allocation_address, %{field: new_value})
      {:ok, %AllocationAddress{}}

      iex> update_allocation_address(allocation_address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_allocation_address(%AllocationAddress{} = allocation_address, attrs) do
    allocation_address
    |> AllocationAddress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a allocation_address.

  ## Examples

      iex> delete_allocation_address(allocation_address)
      {:ok, %AllocationAddress{}}

      iex> delete_allocation_address(allocation_address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_allocation_address(%AllocationAddress{} = allocation_address) do
    Repo.delete(allocation_address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking allocation_address changes.

  ## Examples

      iex> change_allocation_address(allocation_address)
      %Ecto.Changeset{source: %AllocationAddress{}}

  """
  def change_allocation_address(%AllocationAddress{} = allocation_address) do
    AllocationAddress.changeset(allocation_address, %{})
  end
end
