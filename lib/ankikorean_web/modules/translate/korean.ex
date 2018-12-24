defmodule AnkikoreanWeb.Korean do
  @moduledoc false

  @korean_dictionary Application.get_env(:ankikorean, :korean_dictionary)

  def patch(email, value) do
    translation = @korean_dictionary.korean_to_english(value)
                  |> String.replace(",", "")
                  |> String.replace("  ", " ")
                  |> String.replace(~r/((?!^)[0-9])/, " \\1")

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
