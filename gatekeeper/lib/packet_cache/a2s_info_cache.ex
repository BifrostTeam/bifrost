defmodule GateKeeper.PacketCache.A2SInfoCache do
  use GenServer
  require Logger

  def start_link(port) do
    GenServer.start_link(__MODULE__, port)
  end

  def init(port) do
    {:ok, client} = :gen_udp.open(port)
    :inet.setopts(client, [active: :once, mode: :binary])
    {:ok, %{socket: client}}
  end

  def handle_info({:udp, client, ip, in_port, <<0xff, 0xff, 0xff, 0xff, "TSource Engine Query", 0x00>>}, state) do
    Logger.debug("Got A2S_INFO packet")
    :gen_udp.send(client, {ip, in_port}, "Hello world!")

    {:noreply, state}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end
end
