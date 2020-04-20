defmodule GateKeeper.PacketCache.UDPCacheResponder do
  use GenServer
  require Logger

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init({port, packet_matcher, cache_handler}) do
    {:ok, client} = :gen_udp.open(port)
    :inet.setopts(client, [active: :once, mode: :binary])

    {:ok, %{socket: client, cache_handler: cache_handler, packet_matcher: packet_matcher}}
  end

  def handle_info({:udp, socket, ip, in_port, data}, %{cache_handler: cache_handler, packet_matcher: packet_matcher} = state) do
    if packet_matcher.(data) do
      Logger.debug("PacketMatch", [packet_data: data])
      :gen_udp.send(socket, {ip, in_port}, GenServer.call(cache_handler, :get_cache_data))
    end

    {:noreply, state}
  end
end
