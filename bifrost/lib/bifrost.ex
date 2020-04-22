defmodule Bifrost do
  @moduledoc """
  A pretentiously named library for symmetric key encryption between too endpoints where
  managing certificates is too cumbersome.
  """

  @doc """
  Quick and dirty implementation of PBKDF2, used by Bifrost for deriving an encryption key
  from the socket token provided. Doesn't fully conform to the spec, namely the output size
  is just the size out the output from the chosen hash algorithm.

  There's no corresponding validation function since the AEAD performed on the socket serves
  that purpose for this library.

  Examples
  ```
  {key, salt} = Bifrost.pbkdf2(:sha256, "apikey", 2000)
  ```
  """
  def pbkdf2(algo, data, iterations) do
    salt = :crypto.strong_rand_bytes(12)

    pbkdf2(algo, data, salt, iterations)
  end

  def pbkdf2(algo, data, salt, iterations) do
    digest = :crypto.hash(algo, data <> ":" <> salt <> <<1::big-unsigned-32>>)

    pbkdf2(algo, digest, salt, iterations, 1)
  end

  defp pbkdf2(_algo, data, salt, iterations, iteration) when iteration == iterations do
    {data, salt}
  end

  defp pbkdf2(algo, data, salt, iterations, iteration) do
    digest = :crypto.hash(algo, data)
    xored = :crypto.exor(data, digest)
    pbkdf2(algo, xored, salt, iterations, iteration + 1)
  end
end
