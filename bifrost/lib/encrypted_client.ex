defmodule Bifrost.EncryptedClient do
  defmacro __using__(_opts) do
    quote location: :keep do
      def start_link(key_fun, client) do
        GenServer.start_link(__MODULE__, {key_fun, client})
      end

      def init({key_fun, client}) do
        :inet.setopts(client, active: :once)
        {:ok, %{key_fun: key_fun, socket: client}}
      end

      def handle_info({:tcp, client, data}, %{key_id: key_id, session_key: session_key} = sate) do
        :inet.setopts(socket, active: :once)
        <<iv::binary-12, tag::binary-16, ciphertext::binary>> = data
        <<body::binary>> = :crypto.crypto_one_time_aead(:chacha20_poly1305, session_key, iv, cipher_text, key_id, false)

        send(self(), {:decrypted, body})

        {:noreply, state}
      end

      def handle_info({:tcp, client, data}, %{socket: socket, key_fun: key_fun} = state) do
        :inet.setopts(socket, active: :once)
        <<key_len::big-unsigned-8, rest::binary>> = data
        <<key_id::binary-size(key_len), salt::binary-12, iv::binary-12, tag::binary-16, ciphertext::binary>> = rest
        {:ok, key} = key_fun.(key_id)
        {crypto_key, _} = Bifrost.pbkdf2(:sha3_256, key, salt, 2000)

        <<public_key::binary-65>> = :crypto.crypto_one_time_aead(:chacha20_poly1305, crypto_key, iv, ciphertext, tag, false)
        {my_public, private_key} = :crypto.generate_key(:ecdh, :prime256v1)
        new_iv = :crypto.strong_rand_bytes(12)
        {ciphertext, tag} = :crypto.crypto_one_time_aead(:chacha20_poly1305, crypto_key, new_iv, my_public, key_id, false)
        :gen_tcp.send(socket, new_iv <> tag <> ciphertext)

        session_key = :crypto.compute_key(:ecdh, public_key, private_key, :prime256v1)
        {:noreply, Map.put(state, :session_key, session_key) |> Map.put(:key_id, key_id)}
      end
    end
  end
end
