defmodule AnkikoreanWeb.KoreanDictionary do
  @moduledoc false

  @callback korean_to_english(String) :: String

  @callback format(String) :: String
end
