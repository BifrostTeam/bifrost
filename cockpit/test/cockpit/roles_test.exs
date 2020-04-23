defmodule Cockpit.RolesTest do
  use Cockpit.DataCase

  alias Cockpit.Roles

  describe "roles" do
    alias Cockpit.Roles.Role

    @valid_attrs %{role_name: "some role_name"}
    @update_attrs %{role_name: "some updated role_name"}
    @invalid_attrs %{role_name: nil}

    def role_fixture(attrs \\ %{}) do
      {:ok, role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_role()

      role
    end

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Roles.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Roles.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      assert {:ok, %Role{} = role} = Roles.create_role(@valid_attrs)
      assert role.role_name == "some role_name"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roles.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      assert {:ok, %Role{} = role} = Roles.update_role(role, @update_attrs)
      assert role.role_name == "some updated role_name"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Roles.update_role(role, @invalid_attrs)
      assert role == Roles.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Roles.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Roles.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Roles.change_role(role)
    end
  end

  describe "role_resources" do
    alias Cockpit.Roles.RoleResource

    @valid_attrs %{resource_ident: "some resource_ident"}
    @update_attrs %{resource_ident: "some updated resource_ident"}
    @invalid_attrs %{resource_ident: nil}

    def role_resource_fixture(attrs \\ %{}) do
      {:ok, role_resource} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_role_resource()

      role_resource
    end

    test "list_role_resources/0 returns all role_resources" do
      role_resource = role_resource_fixture()
      assert Roles.list_role_resources() == [role_resource]
    end

    test "get_role_resource!/1 returns the role_resource with given id" do
      role_resource = role_resource_fixture()
      assert Roles.get_role_resource!(role_resource.id) == role_resource
    end

    test "create_role_resource/1 with valid data creates a role_resource" do
      assert {:ok, %RoleResource{} = role_resource} = Roles.create_role_resource(@valid_attrs)
      assert role_resource.resource_ident == "some resource_ident"
    end

    test "create_role_resource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roles.create_role_resource(@invalid_attrs)
    end

    test "update_role_resource/2 with valid data updates the role_resource" do
      role_resource = role_resource_fixture()
      assert {:ok, %RoleResource{} = role_resource} = Roles.update_role_resource(role_resource, @update_attrs)
      assert role_resource.resource_ident == "some updated resource_ident"
    end

    test "update_role_resource/2 with invalid data returns error changeset" do
      role_resource = role_resource_fixture()
      assert {:error, %Ecto.Changeset{}} = Roles.update_role_resource(role_resource, @invalid_attrs)
      assert role_resource == Roles.get_role_resource!(role_resource.id)
    end

    test "delete_role_resource/1 deletes the role_resource" do
      role_resource = role_resource_fixture()
      assert {:ok, %RoleResource{}} = Roles.delete_role_resource(role_resource)
      assert_raise Ecto.NoResultsError, fn -> Roles.get_role_resource!(role_resource.id) end
    end

    test "change_role_resource/1 returns a role_resource changeset" do
      role_resource = role_resource_fixture()
      assert %Ecto.Changeset{} = Roles.change_role_resource(role_resource)
    end
  end

  describe "role_actions" do
    alias Cockpit.Roles.RoleResourceAction

    @valid_attrs %{action: "some action", effect: "some effect"}
    @update_attrs %{action: "some updated action", effect: "some updated effect"}
    @invalid_attrs %{action: nil, effect: nil}

    def role_resource_action_fixture(attrs \\ %{}) do
      {:ok, role_resource_action} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_role_resource_action()

      role_resource_action
    end

    test "list_role_actions/0 returns all role_actions" do
      role_resource_action = role_resource_action_fixture()
      assert Roles.list_role_actions() == [role_resource_action]
    end

    test "get_role_resource_action!/1 returns the role_resource_action with given id" do
      role_resource_action = role_resource_action_fixture()
      assert Roles.get_role_resource_action!(role_resource_action.id) == role_resource_action
    end

    test "create_role_resource_action/1 with valid data creates a role_resource_action" do
      assert {:ok, %RoleResourceAction{} = role_resource_action} = Roles.create_role_resource_action(@valid_attrs)
      assert role_resource_action.action == "some action"
      assert role_resource_action.effect == "some effect"
    end

    test "create_role_resource_action/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roles.create_role_resource_action(@invalid_attrs)
    end

    test "update_role_resource_action/2 with valid data updates the role_resource_action" do
      role_resource_action = role_resource_action_fixture()
      assert {:ok, %RoleResourceAction{} = role_resource_action} = Roles.update_role_resource_action(role_resource_action, @update_attrs)
      assert role_resource_action.action == "some updated action"
      assert role_resource_action.effect == "some updated effect"
    end

    test "update_role_resource_action/2 with invalid data returns error changeset" do
      role_resource_action = role_resource_action_fixture()
      assert {:error, %Ecto.Changeset{}} = Roles.update_role_resource_action(role_resource_action, @invalid_attrs)
      assert role_resource_action == Roles.get_role_resource_action!(role_resource_action.id)
    end

    test "delete_role_resource_action/1 deletes the role_resource_action" do
      role_resource_action = role_resource_action_fixture()
      assert {:ok, %RoleResourceAction{}} = Roles.delete_role_resource_action(role_resource_action)
      assert_raise Ecto.NoResultsError, fn -> Roles.get_role_resource_action!(role_resource_action.id) end
    end

    test "change_role_resource_action/1 returns a role_resource_action changeset" do
      role_resource_action = role_resource_action_fixture()
      assert %Ecto.Changeset{} = Roles.change_role_resource_action(role_resource_action)
    end
  end

  describe "role_keys" do
    alias Cockpit.Roles.ApiKey

    @valid_attrs %{key: "some key", key_id: "some key_id"}
    @update_attrs %{key: "some updated key", key_id: "some updated key_id"}
    @invalid_attrs %{key: nil, key_id: nil}

    def api_key_fixture(attrs \\ %{}) do
      {:ok, api_key} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_api_key()

      api_key
    end

    test "list_role_keys/0 returns all role_keys" do
      api_key = api_key_fixture()
      assert Roles.list_role_keys() == [api_key]
    end

    test "get_api_key!/1 returns the api_key with given id" do
      api_key = api_key_fixture()
      assert Roles.get_api_key!(api_key.id) == api_key
    end

    test "create_api_key/1 with valid data creates a api_key" do
      assert {:ok, %ApiKey{} = api_key} = Roles.create_api_key(@valid_attrs)
      assert api_key.key == "some key"
      assert api_key.key_id == "some key_id"
    end

    test "create_api_key/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roles.create_api_key(@invalid_attrs)
    end

    test "update_api_key/2 with valid data updates the api_key" do
      api_key = api_key_fixture()
      assert {:ok, %ApiKey{} = api_key} = Roles.update_api_key(api_key, @update_attrs)
      assert api_key.key == "some updated key"
      assert api_key.key_id == "some updated key_id"
    end

    test "update_api_key/2 with invalid data returns error changeset" do
      api_key = api_key_fixture()
      assert {:error, %Ecto.Changeset{}} = Roles.update_api_key(api_key, @invalid_attrs)
      assert api_key == Roles.get_api_key!(api_key.id)
    end

    test "delete_api_key/1 deletes the api_key" do
      api_key = api_key_fixture()
      assert {:ok, %ApiKey{}} = Roles.delete_api_key(api_key)
      assert_raise Ecto.NoResultsError, fn -> Roles.get_api_key!(api_key.id) end
    end

    test "change_api_key/1 returns a api_key changeset" do
      api_key = api_key_fixture()
      assert %Ecto.Changeset{} = Roles.change_api_key(api_key)
    end
  end
end
