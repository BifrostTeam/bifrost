# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cockpit.Repo.insert!(%Cockpit.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
{:ok, user}  = Cockpit.Accounts.create_user(%{name: "Dreae", password: "foobar", email: "dreae@dreae.onl"})
{:ok, role} = Cockpit.Roles.create_role(%{role_name: "user_Dreae"})
{:ok, _} = Cockpit.Accounts.create_user_role(%{user_id: user.id, role_id: role.id})
{:ok, _} = Cockpit.Roles.create_api_key(%{role_id: role.id, key_id: "foobar", key: "barfoo"})


{:ok, resource} = Cockpit.Roles.create_role_resource(%{role_id: role.id, resource_ident: "rn:allocations:*"})
{:ok, _} = Cockpit.Roles.create_role_resource_action(%{role_resource_id: resource.id, action: "*", effect: "allow"})
{:ok, resource} = Cockpit.Roles.create_role_resource(%{role_id: role.id, resource_ident: "rn:gameservers:*"})
{:ok, _} = Cockpit.Roles.create_role_resource_action(%{role_resource_id: resource.id, action: "*", effect: "allow"})
{:ok, resource} = Cockpit.Roles.create_role_resource(%{role_id: role.id, resource_ident: "rn:nodes:*"})
{:ok, _} = Cockpit.Roles.create_role_resource_action(%{role_resource_id: resource.id, action: "*", effect: "allow"})
{:ok, resource} = Cockpit.Roles.create_role_resource(%{role_id: role.id, resource_ident: "rn:users:*"})
{:ok, _} = Cockpit.Roles.create_role_resource_action(%{role_resource_id: resource.id, action: "*", effect: "allow"})

{:ok, allocation} = Cockpit.Allocations.create_allocation(%{cidr_prefix: "172.18.0.0/12"})
{:ok, address} = Cockpit.Allocations.create_allocation_address(%{allocation_id: allocation.id, address: "172.18.0.1"})
{:ok, game_server} = Cockpit.GameServers.create_game_server(%{server_name: "bhop", host_ip: "192.168.1.2", host_port: 1337})
{:ok, _} = Cockpit.GameServers.create_game_server_allocation(%{game_server_id: game_server.id, allocation_address_id: address.id})
