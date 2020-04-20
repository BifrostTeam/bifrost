defmodule GateKeeper.PacketCache.UDPCacheHandler do
  use GenServer
  require Logger

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init({remote_ip, remote_port, request_packet, ttl}) do
    {:ok, socket} = :gen_udp.open(0)
    :inet.setopts(socket, [active: :once, mode: :binary])

    send(self(), :update_cache)
    :timer.send_interval(ttl * 1000, :update_cache)

    {:ok, %{
      remote_ip: remote_ip,
      remote_port: remote_port,
      socket: socket,
      request_packet: request_packet,
      packet_data: <<>>
    }}
  end

  def handle_call(:get_cache_data, _from, %{packet_data: data} = state), do: {:reply, data, state}

  def handle_info(:update_cache, %{remote_ip: remote_ip, remote_port: remote_port, request_packet: request_packet, socket: socket} = state) do
    :gen_udp.send(socket, {remote_ip, remote_port}, request_packet)

    {:noreply, state}
  end

  def handle_info({:udp, _socket, ip, _in_port, data}, %{remote_ip: remote_ip} = state) do
    case ip do
      ^remote_ip ->
        {:noreply, %{state | packet_data: data}}
      _ ->
        {:noreply, state}
    end
  end
end
