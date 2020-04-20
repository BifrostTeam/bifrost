defmodule GateKeeper do
  def start(_type, _args) do
    # Obviously this will all be created dynamically, I'm just taking notes
    {:ok, cache_handler} = GenServer.start_link(GateKeeper.PacketCache.UDPCacheHandler, {{127, 0, 0, 1}, 27015, <<0xff, 0xff, 0xff, 0xff, "TSource Engine Query", 0x00>>, 300})
    a2s_info_matcher = fn
      <<0xff, 0xff, 0xff, 0xff, "TSource Engine Query", 0x00>> -> true
      _ -> false
    end

    children = [
      {GateKeeper.PacketCache.UDPCacheResponder, {1337, a2s_info_matcher, cache_handler}}
    ]

    opts = [strategy: :one_for_one, name: GateKeeper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
