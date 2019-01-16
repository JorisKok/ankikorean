defmodule AnkikoreanWeb.ChineseDict do
  @moduledoc """
  Our small dictionary
  Uses the publicly available ce-dict in assets/dict/
  """

  def translate(chinese) do
    case find_word(chinese) do
      "" ->
        String.split(chinese, "", trim: true)
          |> Enum.map(fn word -> find_word(word) end)
          |> Enum.reject(fn word -> word == "" end)
          |> Enum.join(" AND ")
      result -> result

    end
  end

  defp find_word(chinese) do
    result = File.stream!("assets/dict/cedict_1_0_ts_utf-8_mdbg.txt")
             |> Stream.filter(&(Regex.match?(~r/(^#{chinese} .+?|^.+? #{chinese}) .+/u, &1)))
             |> Enum.to_list
             |> to_string

    Regex.replace(~r/.+?\[(.+)\] \/(.+)(\/\n)/u, result, "\\1 - \\2")
  end
end
