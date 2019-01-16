defmodule AnkikoreanWeb.KrDict do
  use Tesla
  alias AnkikoreanWeb.KoreanDictionary
  @behaviour KoreanDictionary
  @moduledoc """
  KrDict dictionary
  https://krdict.korean.go.kr
  """

  plug Tesla.Middleware.BaseUrl,
       "https://krdict.korean.go.kr/eng/dicSearch/search?nation=eng&nationCode=6&mainSearchWord="
  plug Tesla.Middleware.Timeout, timeout: 10000
  adapter Tesla.Adapter.Hackney

  @impl KoreanDictionary
  def korean_to_english(korean) do
    {:ok, response} = get(URI.encode(korean))

    Floki.find(response.body, "li#article0")
    |> Floki.text
    |> IO.inspect


  end

  @impl KoreanDictionary
  def format(text) do
    text_without_newlines = Regex.replace(~r/[\n\r\t]/, text, "")

    IO.inspect(text_without_newlines)

    case Regex.named_captures(~r/(?<hangul>\p{Hangul}+)\((?<hanzi>.+?)\).+View All (?<english>.+).+/u, text_without_newlines) do
      # If it has no hanzi, then it won't match
      nil -> Regex.named_captures(~r/(?<hangul>\p{Hangul}+)\ .+View All (?<english>.+).+/u, text_without_newlines)
      # If success, just return it
      result -> result
    end

    # TODO now return it nicely
  end

end
