defmodule AnkikoreanWeb.Korean do
  @moduledoc """
  Translate Korean using a dictionary specified in the config files
  """

  @korean_dictionary Application.get_env(:ankikorean, :korean_dictionary)

  def patch(email, value) do
    translation = @korean_dictionary.korean_to_english(value)
                  |> String.replace(",", "")
                  |> String.replace("  ", " ")
                  |> String.replace(~r/((?!^)[0-9])/, " \\1")
                  |> String.replace(~r/\p{Hangul}/u, "")
                  |> String.trim_leading()
                  |> String.trim_trailing()

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

  defp merge(nil, p1) do
    p1
  end

  defp merge(p0, p1) do
    Map.merge(p0, p1)
  end
end
