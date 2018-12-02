defmodule AnkikoreanWeb.Korean do
  use Agent
  alias AnkikoreanWeb.Korean
  alias AnkikoreanWeb.KoreanDictionary
  @moduledoc false

  @korean_dictionary Application.get_env(:ankikorean, :korean_dictionary)

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(key) do
    Agent.get(__MODULE__, &Map.get(&1, key))
  end

  def patch(key, value) do
    result = merge(Korean.get(key), %{value => @korean_dictionary.korean_to_english(value)})

    :ok = Agent.update(__MODULE__, &Map.put(&1, key, result))

    result
  end

  defp merge(nil, p1) do
    p1
  end

  defp merge(p0, p1) do
    Map.merge(p0, p1)
  end



end
