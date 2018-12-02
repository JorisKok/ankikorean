defmodule AnkikoreanWeb.Daum do
  use Tesla
  alias AnkikoreanWeb.KoreanDictionary
  @behaviour KoreanDictionary
  @moduledoc false

  plug Tesla.Middleware.BaseUrl, "http://dic.daum.net/search.do?q="

  @impl KoreanDictionary
  def korean_to_english(korean) do
    #    {:ok, response} = get(URI.encode(korean) <> "&dic=eng&search_first=Y")
    #
    #    Floki.find(response.body, "[data-target=word]")
    #    |> Floki.find("div.cleanword_type")
    #    |> Floki.text()
    #    |> URI.encode()
    #    |> format()
    #    |> URI.decode()

    "FROM DAUM"
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
