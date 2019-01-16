defmodule AnkikoreanWeb.KrDictMock do
  alias AnkikoreanWeb.KoreanDictionary
  @behaviour AnkikoreanWeb.KoreanDictionary
  @moduledoc """
  Mocks the KrDict dictionary
  """

  @impl KoreanDictionary
  def korean_to_english(_value) do
    "건설하다\r\n\t\t\t\t\t\t\t\t\t(建設하다)\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t       \t\t\t\t\t\t동사\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t       \t\t\t\t\t\t\r\n\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\tVerb\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t[건ː설하다]\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t                        \t\tView All 1.build; construct건물이나 시설을 새로 짓다.To construct new buildings or facilities.2.establish; found나라나 조reate a country or an organization."
  end

  @impl KoreanDictionary
  def format(text) do
    AnkikoreanWeb.KrDict.format(text)
  end
end
