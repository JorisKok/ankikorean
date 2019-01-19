defmodule AnkikoreanWeb.ChineseDict do
  alias Ankikorean.ChineseCache
  @moduledoc """
  Our small dictionary
  Uses the publicly available ce-dict in assets/dict/
  """

  def translate(chinese) do
    case Regex.replace(~r/\p{Hangul}/u, chinese, "")
         |> find_word do
      nil ->
        case String.split(chinese, "", trim: true)
             |> Enum.map(fn word -> find_word(word) end)
             |> Enum.reject(fn word -> word == nil end)
          do
            [] -> nil
            result -> Enum.join(result, " AND ")
        end
      result -> result

    end
  end

  defp find_word(chinese) do
    case ChineseCache.get(chinese) do
      {:found, translation} -> translation
      _ -> nil
    end
  end
end
