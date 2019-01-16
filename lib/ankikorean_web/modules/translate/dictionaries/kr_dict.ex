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

  @doc """
  Extract the hangul, hanzi and english translation
  """
  @impl KoreanDictionary
  def format(text) do
    text_without_newlines = Regex.replace(~r/[\n\r\t]/, text, "")

    case Regex.named_captures(
           ~r/(?<hangul>\p{Hangul}+)\((?<hanzi>.+?)\).+View All (?<english>.+).+/u,
           text_without_newlines
         ) do
      # If it has no hanzi, then it won't match
      nil -> Regex.named_captures(~r/(?<hangul>\p{Hangul}+)\ .+View All (?<english>.+).+/u, text_without_newlines) |> format_matches
      # If success, just return it
      result -> result |> format_matches
    end
  end

  @doc """
  Format the matched hangul, hanzi and english to be nicely shown in anki

  Put a new line between the hangul and roman, to create the following format:
    Definition
    Korean sentence
    Sentence translation in English
  """
  def format_matches(%{"english" => english}) do
    # Add a newline between the definition and Korean sentence
    one = Regex.replace(~r/([a-zA-Z])(\p{Hangul})/u, english, "\\1\n\\2")

    # Add a newline between the Korean sentence and the sentence translation
    two = Regex.replace(~r/(\p{Hangul}\.)([a-zA-Z])/u, one, "\\1\n\\2")

    # If multiple definitions are found, they are identified by .2. and .3. etc
    Regex.replace(~r/(\.)([2-9]\.)/, two, "\\1\n\\2")
  end
end
