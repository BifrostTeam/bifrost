defmodule Cockpit.Repo do
  use Ecto.Repo,
    otp_app: :cockpit,
    adapter: Ecto.Adapters.Postgres
end
