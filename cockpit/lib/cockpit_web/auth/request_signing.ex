defmodule CockpitWeb.Auth.RequestSigningPlug do
  import Plug.Conn
  alias Cockpit.Roles

  def init(config), do: config

  def call(%Plug.Conn{req_headers: %{"X-Cockpit-KeyID" => key_id, "X-Cockpit-Auth-Signature" => signature} = _headers} = conn, _config) do
    {:ok, body, _conn} = read_body(conn)
    signed_params = key_id <> conn.method <> conn.request_path <> body
    case Roles.get_api_key(key_id) do
      nil ->
        assign(conn, :auth, :error)
      api_key ->
        gen_sig = :crypto.mac(:hmac, :sha3_256, api_key.key, signed_params)
        if Base.encode16(gen_sig) == signature do
          assign(conn, :auth, api_key.role_id)
          assign(conn, :auth_policy, Roles.get_policy_document(api_key.role_id))
        else
          assign(conn, :auth, :error)
        end
    end
  end

  def call(conn, _config) do
    assign(conn, :auth, :error)
  end
end
