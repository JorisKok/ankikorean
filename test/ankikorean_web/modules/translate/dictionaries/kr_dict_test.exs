defmodule AnkikoreanWeb.KrDictTest do
  use AnkikoreanWeb.ConnCase
  alias AnkikoreanWeb.KrDict
  import AssertValue

  @doc """
  Note: The response from KrDict contains a lot of \t\n etc
  """
  describe "Test that the response from KrDict is properly formatted" do

    test "format for 건설하다", %{} do
      assert_value KrDict.format(
                     "건설하다\r\n\t\t\t\t\t\t\t\t\t(建設하다)\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t       \t\t\t\t\t\t동사\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t       \t\t\t\t\t\t\r\n\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\tVerb\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t[건ː설하다]\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t                        \t\tView All 1.build; construct건물이나 시설을 새로 짓다.To construct new buildings or facilities.2.establish; found나라나 조reate a country or an organization."
                   ) ==
                     %{
                       "hanzi" => "建設하다",
                       "translation" =>
                         "1.build; construct\n건물이나 시설을 새로 짓다.\nTo construct new buildings or facilities.\n2.establish; found\n나라나 조reate a country or an organization"
                     }
    end

    test "format for 시원섭섭하다", %{} do
      assert_value KrDict.format(
                     "시원섭섭하다\r\n\t\t\t       \t\t\t\t\t\t형용사\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t       \t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\tAdjective\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t[시원섭써파다]\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\tView All feeling mixed emotions;  mixed feelings한편으로는 후련하고 다른 한편으로는 서운하고 아쉽다.Feeling relieved on the one hand, but feeling sad and sorry on the other.\r\n"
                   ) ==
                     """
                     feeling mixed emotions;  mixed feelings
                     한편으로는 후련하고 다른 한편으로는 서운하고 아쉽다.
                     Feeling relieved on the one hand, but feeling sad and sorry on the other<NOEOL>
                     """
    end

    test "format for 자동차", %{} do
      assert_value KrDict.format(
                     "자동차\r\n\t\t\t\t\t\t\t\t\t(自動車)\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t       \t\t\t\t\t\t명사\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t       \t\t\t\t\t\t\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\tNoun\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t[자동차]\r\n\t\t\t\t\t\t\t\t\tView All car; automob엔진의 힘으로 바퀴를 굴려서 도로 위를 움직이도록 만든 차.A vehicle which moves its wheels by the power of its engine in order to run on roads."
                   ) ==
                     %{
                       "hanzi" => "自動車",
                       "translation" =>
                         "car; automob\n엔진의 힘으로 바퀴를 굴려서 도로 위를 움직이도록 만든 차.\nA vehicle which moves its wheels by the power of its engine in order to run on roads"
                     }
    end

  end

end
