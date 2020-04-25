defmodule Cockpit.AllocationsTest do
  use Cockpit.DataCase

  alias Cockpit.Allocations

  describe "allocation_prefix" do
    alias Cockpit.Allocations.Allocation

    @valid_attrs %{cidr_prefix: "some cidr_prefix"}
    @update_attrs %{cidr_prefix: "some updated cidr_prefix"}
    @invalid_attrs %{cidr_prefix: nil}

    def allocation_fixture(attrs \\ %{}) do
      {:ok, allocation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Allocations.create_allocation()

      allocation
    end

    test "list_allocation_prefix/0 returns all allocation_prefix" do
      allocation = allocation_fixture()
      assert Allocations.list_allocation_prefix() == [allocation]
    end

    test "get_allocation!/1 returns the allocation with given id" do
      allocation = allocation_fixture()
      assert Allocations.get_allocation!(allocation.id) == allocation
    end

    test "create_allocation/1 with valid data creates a allocation" do
      assert {:ok, %Allocation{} = allocation} = Allocations.create_allocation(@valid_attrs)
      assert allocation.cidr_prefix == "some cidr_prefix"
    end

    test "create_allocation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Allocations.create_allocation(@invalid_attrs)
    end

    test "update_allocation/2 with valid data updates the allocation" do
      allocation = allocation_fixture()
      assert {:ok, %Allocation{} = allocation} = Allocations.update_allocation(allocation, @update_attrs)
      assert allocation.cidr_prefix == "some updated cidr_prefix"
    end

    test "update_allocation/2 with invalid data returns error changeset" do
      allocation = allocation_fixture()
      assert {:error, %Ecto.Changeset{}} = Allocations.update_allocation(allocation, @invalid_attrs)
      assert allocation == Allocations.get_allocation!(allocation.id)
    end

    test "delete_allocation/1 deletes the allocation" do
      allocation = allocation_fixture()
      assert {:ok, %Allocation{}} = Allocations.delete_allocation(allocation)
      assert_raise Ecto.NoResultsError, fn -> Allocations.get_allocation!(allocation.id) end
    end

    test "change_allocation/1 returns a allocation changeset" do
      allocation = allocation_fixture()
      assert %Ecto.Changeset{} = Allocations.change_allocation(allocation)
    end
  end

  describe "allocation_address" do
    alias Cockpit.Allocations.AllocationAddress

    @valid_attrs %{address: "some address"}
    @update_attrs %{address: "some updated address"}
    @invalid_attrs %{address: nil}

    def allocation_address_fixture(attrs \\ %{}) do
      {:ok, allocation_address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Allocations.create_allocation_address()

      allocation_address
    end

    test "list_allocation_address/0 returns all allocation_address" do
      allocation_address = allocation_address_fixture()
      assert Allocations.list_allocation_address() == [allocation_address]
    end

    test "get_allocation_address!/1 returns the allocation_address with given id" do
      allocation_address = allocation_address_fixture()
      assert Allocations.get_allocation_address!(allocation_address.id) == allocation_address
    end

    test "create_allocation_address/1 with valid data creates a allocation_address" do
      assert {:ok, %AllocationAddress{} = allocation_address} = Allocations.create_allocation_address(@valid_attrs)
      assert allocation_address.address == "some address"
    end

    test "create_allocation_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Allocations.create_allocation_address(@invalid_attrs)
    end

    test "update_allocation_address/2 with valid data updates the allocation_address" do
      allocation_address = allocation_address_fixture()
      assert {:ok, %AllocationAddress{} = allocation_address} = Allocations.update_allocation_address(allocation_address, @update_attrs)
      assert allocation_address.address == "some updated address"
    end

    test "update_allocation_address/2 with invalid data returns error changeset" do
      allocation_address = allocation_address_fixture()
      assert {:error, %Ecto.Changeset{}} = Allocations.update_allocation_address(allocation_address, @invalid_attrs)
      assert allocation_address == Allocations.get_allocation_address!(allocation_address.id)
    end

    test "delete_allocation_address/1 deletes the allocation_address" do
      allocation_address = allocation_address_fixture()
      assert {:ok, %AllocationAddress{}} = Allocations.delete_allocation_address(allocation_address)
      assert_raise Ecto.NoResultsError, fn -> Allocations.get_allocation_address!(allocation_address.id) end
    end

    test "change_allocation_address/1 returns a allocation_address changeset" do
      allocation_address = allocation_address_fixture()
      assert %Ecto.Changeset{} = Allocations.change_allocation_address(allocation_address)
    end
  end
end
