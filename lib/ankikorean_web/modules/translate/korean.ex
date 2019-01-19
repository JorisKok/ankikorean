defmodule AnkikoreanWeb.Korean do
  alias AnkikoreanWeb.ChineseDict

  @moduledoc """
  Translate Korean using a dictionary specified in the config files
  """

  @korean_dictionary Application.get_env(:ankikorean, :korean_dictionary)

  def patch(email, value) do
    case @korean_dictionary.korean_to_english(value) |> @korean_dictionary.format do
      %{"translation" => translation, "hanzi" => hanzi} ->
        set_korean_translation(email, value, translation)
        set_chinese_translation(email, hanzi)
      nil -> nil
      translation ->
        set_korean_translation(email, value, translation)
    end
  end

  defp set_chinese_translation(email, hanzi) do
    case ChineseDict.translate(hanzi) do
      nil -> nil
      translation -> set_translation(email, hanzi, translation)
    end
  end

  defp set_korean_translation(email, value, translation) do
    set_translation(email, value, translation)
  end

  defp set_translation(email, value, translation) do
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
