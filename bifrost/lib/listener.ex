defmodule Bifrost.Listener do
  def start_link(key_fun, module, func, opts \\ []) do
    ip = Keyword.get(opts, :address, {0, 0, 0, 0})
    port = Keyword.get(opts, :port, 23233)

    Task.start_link(__MODULE__, :start_listen, [key_fun, module, func, ip, port])
  end

  def start_listen(key_fun, module, func, ip, port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: 2, active: false, reuseaddr: true, ip: ip])
    supervisor = DynamicSupervisor.start_link([strategy: :one_for_one])

    loop_accept(key_fun, module, func, supervisor, socket)
  end

  def loop_accept(key_fun, module, func, supervisor, socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    {:ok, pid} = DynamicSupervisor.start_child(supervisor, {module, func, [key_fun, client]})
    :ok = :gen_tcp.controlling_process(client, pid)

    loop_accept(key_fun, module, func, supervisor, socket)
  end
end
