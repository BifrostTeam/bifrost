defmodule CockpitWeb.Auth do
  defmacro validate_auth(conn, body) do
    quote location: :keep do
      case unquote(conn).assigns do
        %{auth: :error} = _assigns ->
          raise CockpitWeb.Auth.AuthorizationError, plug_status: 401
        %{auth: _role, auth_policy: _policy_document} = _assigns ->
          unquote(body[:do])
      end
    end
  end

  defmacro authorized(conn, sub_resource, action, body) do
    quote location: :keep do
      CockpitWeb.Auth.validate_auth unquote(conn) do
        %{auth_policy: policy_document} = unquote(conn).assigns
        case CockpitWeb.Auth.validate_role_policy(policy_document, @endpoint, unquote(sub_resource), unquote(action)) do
          true ->
            unquote(body[:do])
          _ -> raise CockpitWeb.Auth.AuthorizationError, plug_status: 403
        end
      end
    end
  end

  def validate_role_policy(policy_document, endpoint, sub_resource, action) do
    actions = Enum.flat_map(policy_document.resources, fn (resource) ->
      cond do
        "rn:#{endpoint}:#{sub_resource}" == resource.resource_ident ->
          Enum.filter(resource.actions, &(&1.action == action or &1.action == "*")) |> Enum.map(&(%{prio: 1, effect: &1.effect}))
        "rn:#{endpoint}:*" == resource.resource_ident ->
          Enum.filter(resource.actions, &(&1.action == action or &1.action == "*")) |> Enum.map(&(%{prio: 0, effect: &1.effect}))
        true -> []
      end
    end)

    case Enum.sort_by(actions, &(&1.prio), &(&2 < &1)) do
      [action | _] -> action.effect == "allow"
      [] -> false
    end
  end
end
