defmodule AnkikoreanWeb.DaumMock do
  @behaviour AnkikoreanWeb.KoreanDictionary
  @moduledoc false

  @impl KoreanDictionary
  def korean_to_english(value) do
    "1.Hello2.Greeting,3.Hey"
  end
end
