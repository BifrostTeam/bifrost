defmodule Cockpit.GameServersTest do
  use Cockpit.DataCase

  alias Cockpit.GameServers

  describe "game_server" do
    alias Cockpit.GameServers.GameServer

    @valid_attrs %{host_ip: 42, host_port: 42, server_name: "some server_name"}
    @update_attrs %{host_ip: 43, host_port: 43, server_name: "some updated server_name"}
    @invalid_attrs %{host_ip: nil, host_port: nil, server_name: nil}

    def game_server_fixture(attrs \\ %{}) do
      {:ok, game_server} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GameServers.create_game_server()

      game_server
    end

    test "list_game_server/0 returns all game_server" do
      game_server = game_server_fixture()
      assert GameServers.list_game_server() == [game_server]
    end

    test "get_game_server!/1 returns the game_server with given id" do
      game_server = game_server_fixture()
      assert GameServers.get_game_server!(game_server.id) == game_server
    end

    test "create_game_server/1 with valid data creates a game_server" do
      assert {:ok, %GameServer{} = game_server} = GameServers.create_game_server(@valid_attrs)
      assert game_server.host_ip == 42
      assert game_server.host_port == 42
      assert game_server.server_name == "some server_name"
    end

    test "create_game_server/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameServers.create_game_server(@invalid_attrs)
    end

    test "update_game_server/2 with valid data updates the game_server" do
      game_server = game_server_fixture()
      assert {:ok, %GameServer{} = game_server} = GameServers.update_game_server(game_server, @update_attrs)
      assert game_server.host_ip == 43
      assert game_server.host_port == 43
      assert game_server.server_name == "some updated server_name"
    end

    test "update_game_server/2 with invalid data returns error changeset" do
      game_server = game_server_fixture()
      assert {:error, %Ecto.Changeset{}} = GameServers.update_game_server(game_server, @invalid_attrs)
      assert game_server == GameServers.get_game_server!(game_server.id)
    end

    test "delete_game_server/1 deletes the game_server" do
      game_server = game_server_fixture()
      assert {:ok, %GameServer{}} = GameServers.delete_game_server(game_server)
      assert_raise Ecto.NoResultsError, fn -> GameServers.get_game_server!(game_server.id) end
    end

    test "change_game_server/1 returns a game_server changeset" do
      game_server = game_server_fixture()
      assert %Ecto.Changeset{} = GameServers.change_game_server(game_server)
    end
  end

  describe "game_server_allocations" do
    alias Cockpit.GameServers.GameServerAllocation

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def game_server_allocation_fixture(attrs \\ %{}) do
      {:ok, game_server_allocation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GameServers.create_game_server_allocation()

      game_server_allocation
    end

    test "list_game_server_allocations/0 returns all game_server_allocations" do
      game_server_allocation = game_server_allocation_fixture()
      assert GameServers.list_game_server_allocations() == [game_server_allocation]
    end

    test "get_game_server_allocation!/1 returns the game_server_allocation with given id" do
      game_server_allocation = game_server_allocation_fixture()
      assert GameServers.get_game_server_allocation!(game_server_allocation.id) == game_server_allocation
    end

    test "create_game_server_allocation/1 with valid data creates a game_server_allocation" do
      assert {:ok, %GameServerAllocation{} = game_server_allocation} = GameServers.create_game_server_allocation(@valid_attrs)
    end

    test "create_game_server_allocation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameServers.create_game_server_allocation(@invalid_attrs)
    end

    test "update_game_server_allocation/2 with valid data updates the game_server_allocation" do
      game_server_allocation = game_server_allocation_fixture()
      assert {:ok, %GameServerAllocation{} = game_server_allocation} = GameServers.update_game_server_allocation(game_server_allocation, @update_attrs)
    end

    test "update_game_server_allocation/2 with invalid data returns error changeset" do
      game_server_allocation = game_server_allocation_fixture()
      assert {:error, %Ecto.Changeset{}} = GameServers.update_game_server_allocation(game_server_allocation, @invalid_attrs)
      assert game_server_allocation == GameServers.get_game_server_allocation!(game_server_allocation.id)
    end

    test "delete_game_server_allocation/1 deletes the game_server_allocation" do
      game_server_allocation = game_server_allocation_fixture()
      assert {:ok, %GameServerAllocation{}} = GameServers.delete_game_server_allocation(game_server_allocation)
      assert_raise Ecto.NoResultsError, fn -> GameServers.get_game_server_allocation!(game_server_allocation.id) end
    end

    test "change_game_server_allocation/1 returns a game_server_allocation changeset" do
      game_server_allocation = game_server_allocation_fixture()
      assert %Ecto.Changeset{} = GameServers.change_game_server_allocation(game_server_allocation)
    end
  end
end
