defmodule Elasticsearch.Test.DataLoader do
  @moduledoc false
  @behaviour Elasticsearch.DataLoader

  def load(Type1, _offset, limit) when limit <= 10_000 do 
    [%Type1{name: "Name", author: "Author"}]
    |> Stream.cycle()
    |> Stream.map(&Map.put(&1, :id, random_str()))
    |> Enum.take(5000)
  end

  def load(_module, _offset, _limit) do
    []
  end

  defp random_str do
    32
    |> :crypto.strong_rand_bytes()
    |> Base.encode64()
  end
end