defmodule AnkikoreanWeb.DaumMock do
  @behaviour AnkikoreanWeb.KoreanDictionary
  @moduledoc false

  @impl KoreanDictionary
  def korean_to_english(value) do
    "hello"
  end
end
