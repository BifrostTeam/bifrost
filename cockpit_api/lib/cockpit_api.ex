defmodule CockpitApi do
  @moduledoc """
  Documentation for `CockpitApi`.
  """

  def do_request(method, url) do
    do_request(method, url, [], <<>>)
  end

  def do_request(method, url, headers) do
    do_request(method, url, headers, <<>>)
  end

  def do_request(method, url, headers, body) do
    auth_time = DateTime.to_iso8601(DateTime.utc_now())
    {key_id, key} = Application.get_env(:cockpit_api, :api_key)
    {:hackney_url, _, _, _, _, path, _, _, _, _, _, _} = :hackney_url.parse_url(url)
    signed_params = key_id <> String.upcase(Atom.to_string(method)) <> path <> auth_time <> body
    signature = :crypto.mac(:hmac, :sha3_256, key, signed_params)
    signature = String.downcase(Base.encode16(signature))

    headers = headers ++ ["X-Cockpit-Auth-Time": auth_time, "X-Cockpit-KeyID": key_id, "X-Cockpit-Auth-Signature": signature]

    :hackney.request(method, url, headers, body)
  end
end
