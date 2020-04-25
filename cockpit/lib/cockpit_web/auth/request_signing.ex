defmodule CockpitWeb.Auth.RequestSigningPlug do
  import Plug.Conn
  alias Cockpit.Roles

  def init(config), do: config

  def call(conn, _config) do
    signature = get_req_header(conn, "x-cockpit-auth-signature")
    request_time = get_req_header(conn, "x-cockpit-auth-time")
    key_id = get_req_header(conn, "x-cockpit-keyid")

    check_auth(conn, signature, request_time, key_id)
  end

  def check_auth(conn, [signature], [request_time], [key_id]) do
    {:ok, body, _conn} = read_body(conn)
    signed_params = key_id <> conn.method <> conn.request_path <> request_time <> body
    case DateTime.from_iso8601(request_time) do
      {:ok, auth_time, 0} ->
        if DateTime.diff(DateTime.utc_now(), auth_time, :second) > 120 do
          assign(conn, :auth, :error)
        else
          case Roles.get_api_key(key_id) do
            nil ->
              assign(conn, :auth, :error)
            api_key ->
              gen_sig = :crypto.mac(:hmac, :sha3_256, api_key.key, signed_params)
              if Base.encode16(gen_sig) == signature do
                conn
                |> assign(:auth, api_key.role_id)
                |> assign(:auth_policy, Roles.get_policy_document(api_key.role_id))
              else
                assign(conn, :auth, :error)
              end
          end
        end
      _ ->
        assign(conn, :auth, :error)
    end
  end

  def check_auth(conn, _, _, _) do
    assign(conn, :auth, :error)
  end
end
