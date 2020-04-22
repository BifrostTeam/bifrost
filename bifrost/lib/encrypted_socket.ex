defmodule Bifrost.EncryptedSocket do
  defmacro __using__(_opts) do
    quote location: :keep do
      def start_link(key_id, key, address, port) do
        GenServer.start_link(__MODULE__, %{key_id: key_id, key: key, address: address, port: port})
      end

      def init(%{address: address, port: port} = state) do
        :timer.send_after(1000, {:connect, address, port})
        {:ok, state}
      end

      def handle_call({:send, data}, %{socket: socket, key_id: key_id, session_key: session_key} = state) do
        iv = :crypto.strong_rand_bytes(12)
        {ciphertext, tag} = :crypto.crypto_one_time_aead(:chacha20_poly1305, session_key, iv, data, key_id, true)
        :gen_tcp.send(socket, iv <> tag <> ciphertext)

        {:noreply, state}
      end

      def handle_info({:connect, address, port}, %{key_id: key_id, key: key} = state) do
        {:ok, socket} = :gen_tcp.connect(address, port, [:binary, packet: 2, active: :once])
        {public_key, private_key} = :crypto.generate_key(:ecdh, :prime256v1)
        iv = :crypto.strong_rand_bytes(12)
        {crypto_key, salt} = Bifrost.pbkdf2(:sha3_256, key, 2000)
        {ciphertext, tag} = :crypto.crypto_one_time_aead(:chacha20_poly1305, crypto_key, iv, public_key, key_id, true)

        :gen_tcp.send(socket, <<String.length(key_id)::big-unsigned-8, key_id <> salt <> iv <> tag <> ciphertext>>)
        {:noreply, state |> Map.put(:crypto_key, crypto_key) |> Map.put(:private_key, private_key) |> Map.put(:socket, socket)}
      end

      def handle_info({:tcp, client, data}, %{socket: socket, session_key: session_key, key_id: key_id} = state) do
        :inet.setopts(socket, active: :once)
        <<iv::binary-12, tag::binary-16, ciphertext::binary>> = data
        <<body::binary>> = :crypto.crypto_one_time_aead(:chacha20_poly1305, session_key, iv, ciphertext, key_id, false)

        send(self(), {:decrypted, body})

        {:noreply, state}
      end

      def handle_info({:tcp, client, data}, %{socket: socket, private_key: private_key, crypto_key: crypto_key} = state) do
        :inet.setopts(socket, active: :once)
        <<iv::binary-12, tag::binary-16, ciphertext::binary>> = data
        <<other_public::binary-65>> = :crypto.crypto_one_time_aead(:chacha20_poly1305, crypto_key, iv, ciphertext, tag, false)
        session_key = :crypto.compute_key(:ecdh, other_public, private_key, :primer256v1)

        {:no_reply, Map.put(state, :session_key, :crypto.hash(:sha3_512, session_key))}
      end
    end
  end
end
