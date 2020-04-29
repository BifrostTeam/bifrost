defmodule Cockpit.EdgeServersTest do
  use Cockpit.DataCase

  alias Cockpit.EdgeServers

  describe "edge_servers" do
    alias Cockpit.EdgeServers.EdgeServer

    @valid_attrs %{server_address: "some server_address", server_name: "some server_name"}
    @update_attrs %{server_address: "some updated server_address", server_name: "some updated server_name"}
    @invalid_attrs %{server_address: nil, server_name: nil}

    def edge_server_fixture(attrs \\ %{}) do
      {:ok, edge_server} =
        attrs
        |> Enum.into(@valid_attrs)
        |> EdgeServers.create_edge_server()

      edge_server
    end

    test "list_edge_servers/0 returns all edge_servers" do
      edge_server = edge_server_fixture()
      assert EdgeServers.list_edge_servers() == [edge_server]
    end

    test "get_edge_server!/1 returns the edge_server with given id" do
      edge_server = edge_server_fixture()
      assert EdgeServers.get_edge_server!(edge_server.id) == edge_server
    end

    test "create_edge_server/1 with valid data creates a edge_server" do
      assert {:ok, %EdgeServer{} = edge_server} = EdgeServers.create_edge_server(@valid_attrs)
      assert edge_server.server_address == "some server_address"
      assert edge_server.server_name == "some server_name"
    end

    test "create_edge_server/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EdgeServers.create_edge_server(@invalid_attrs)
    end

    test "update_edge_server/2 with valid data updates the edge_server" do
      edge_server = edge_server_fixture()
      assert {:ok, %EdgeServer{} = edge_server} = EdgeServers.update_edge_server(edge_server, @update_attrs)
      assert edge_server.server_address == "some updated server_address"
      assert edge_server.server_name == "some updated server_name"
    end

    test "update_edge_server/2 with invalid data returns error changeset" do
      edge_server = edge_server_fixture()
      assert {:error, %Ecto.Changeset{}} = EdgeServers.update_edge_server(edge_server, @invalid_attrs)
      assert edge_server == EdgeServers.get_edge_server!(edge_server.id)
    end

    test "delete_edge_server/1 deletes the edge_server" do
      edge_server = edge_server_fixture()
      assert {:ok, %EdgeServer{}} = EdgeServers.delete_edge_server(edge_server)
      assert_raise Ecto.NoResultsError, fn -> EdgeServers.get_edge_server!(edge_server.id) end
    end

    test "change_edge_server/1 returns a edge_server changeset" do
      edge_server = edge_server_fixture()
      assert %Ecto.Changeset{} = EdgeServers.change_edge_server(edge_server)
    end
  end
end
