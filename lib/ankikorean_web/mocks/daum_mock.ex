defmodule AnkikoreanWeb.DaumMock do
  alias AnkikoreanWeb.KoreanDictionary
  @behaviour AnkikoreanWeb.KoreanDictionary
  @moduledoc """
  Mocks the Daum dictionary
  """

  @impl KoreanDictionary
  def korean_to_english(_value) do
    "1.Hello2.Greeting,3.Hey"
  end
end
