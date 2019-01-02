defmodule AnkikoreanWeb.Korean do
  @moduledoc """
  Translate Korean using a dictionary specified in the config files
  """

  @korean_dictionary Application.get_env(:ankikorean, :korean_dictionary)

  def patch(email, value) do
    translation = @korean_dictionary.korean_to_english(value) |> format

    values = case Ankikorean.Cache.get(email) do
      {:not_found} -> %{value => translation}
      {:found, result} -> merge(result, %{value => translation})
    end

    Ankikorean.Cache.set(email, values)
  end

  def delete(email, value) do
    {:found, values} = Ankikorean.Cache.get(email)
    Ankikorean.Cache.set(email, Map.delete(values, value))
  end

  defp format(text) do
    text_1 = Regex.replace(~r/[2-9]\./, text, "#") # Do not replace the 1. with a comma, which will create ", gloomy, somber, dusky" later on
             |> String.trim

    text_2 = Regex.replace(~r/([^A-Za-z\#]+)/, text_1, " ")
             |> String.trim

    Regex.replace(~r/#/, text_2, ", ")
    |> String.replace(~r/\p{Hangul}/u, "")
    |> String.trim

  end

  defp merge(nil, p1) do
    p1
  end

  defp merge(p0, p1) do
    Map.merge(p0, p1)
  end
end
