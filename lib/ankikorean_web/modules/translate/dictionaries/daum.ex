defmodule AnkikoreanWeb.Daum do
  use Tesla
  @moduledoc false

  plug Tesla.Middleware.BaseUrl, "http://dic.daum.net/search.do?q="

  def korean_to_english(korean) do
    {:ok, response} = get(URI.encode(korean) <> "&dic=eng&search_first=Y")

    Floki.find(response.body, "[data-target=word]")
    |> Floki.find("div.cleanword_type")
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
