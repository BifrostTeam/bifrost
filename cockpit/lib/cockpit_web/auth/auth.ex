defmodule CockpitWeb.Auth do
  defmacro authorized(conn, endpoint, sub_resource, action, body) do
    quote location: :keep do
      case unquote(conn).assigns do
        %{auth: :error} = _assigns ->
          put_status(unquote(conn), 401) |> put_view(CockpitWeb.ErrorView) |> render("api_error.json", %{msg: "Auth error"}) |> halt
        %{auth: _role_id, auth_policy: policy_document} = _assigns ->
          case CockpitWeb.Auth.validate_role_policy(policy_document, unquote(endpoint), unquote(sub_resource), unquote(action)) do
            true ->
              unquote(body[:do])
            _ -> put_status(unquote(conn), 403) |> put_view(CockpitWeb.ErrorView) |> render("api_error.json", %{msg: "Forbidden"}) |> halt
          end
      end
    end
  end

  def validate_role_policy(policy_document, endpoint, sub_resource, action) do
    actions = Enum.flat_map(policy_document.resources, fn (resource) ->
      cond do
        "rn:#{endpoint}:#{sub_resource}" == resource.resource_ident ->
          Enum.filter(resource.actions, &(&1.action == action or &1.action == "*")) |> Enum.map(&(%{prio: 0, effect: &1.effect}))
        "rn:#{endpoint}:*" == resource.resource_ident ->
          Enum.filter(resource.actions, &(&1.action == action or &1.action == "*")) |> Enum.map(&(%{prio: 1, effect: &1.effect}))
        true -> []
      end
    end)

    case Enum.sort_by(actions, &(&1.prio), &(&2 < &1)) do
      [action | _] -> action.effect == "allow"
      [] -> false
    end
  end
end
