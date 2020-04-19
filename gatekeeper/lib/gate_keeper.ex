defmodule GateKeeper do
  def start(_type, _args) do
    children = [
      {GateKeeper.PacketCache.A2SInfoCache, 1337}
    ]

    opts = [strategy: :one_for_one, name: GateKeeper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
