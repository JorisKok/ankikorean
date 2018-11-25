defmodule AnkikoreanWeb.KoreanEnglish do
  use Agent
  alias AnkikoreanWeb.KoreanEnglish
  alias AnkikoreanWeb.Daum
  @moduledoc false

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(key) do
    Agent.get(__MODULE__, &Map.get(&1, key))
  end

  def patch(key, value) do
    result = merge(KoreanEnglish.get(key), %{value => Daum.korean_to_english(value)})

    Agent.update(__MODULE__, &Map.put(&1, key, result))
  end

  defp merge(nil, p1) do
    p1
  end

  defp merge(p0, p1) do
    Map.merge(p0, p1)
  end



end
