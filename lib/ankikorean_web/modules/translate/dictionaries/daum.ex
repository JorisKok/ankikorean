defmodule AnkikoreanWeb.Daum do
  use Tesla
  alias AnkikoreanWeb.KoreanDictionary
  @behaviour KoreanDictionary
  @moduledoc """
  Daum dictionary
  http://dic.daum.net
  """

  plug Tesla.Middleware.BaseUrl, "https://dic.daum.net/search.do?q="

  @impl KoreanDictionary
  def korean_to_english(korean) do
    {:ok, response} = get(URI.encode(korean) <> "&dic=eng&search_first=Y")

    Floki.find(response.body, "div.cleanword_type")
    |> Floki.text()
    |> URI.encode()
    |> format()
    |> URI.decode()
  end

  defp format(text) do
    case :binary.match(text, "1") do
      {start, _length} ->
        String.slice(text, start, 500)
      _ ->
        text
    end
  end

end
