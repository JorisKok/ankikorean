defmodule AnkikoreanWeb.ChineseDictTests do
  use AnkikoreanWeb.ConnCase
  alias AnkikoreanWeb.ChineseDict
  import AssertValue

  describe "Test our little chinese dictionary" do
    test "Get the translation for 住戶", %{} do
      assert_value ChineseDict.translate("住戶") == "zhu4 hu4 - inhabitant/householder"
    end

    test "Get the translation for 有名", %{} do
      assert_value ChineseDict.translate("有名") == "you3 ming2 - famous/well-known"
    end

    test "Get the translation for 熱", %{} do
      assert_value ChineseDict.translate("熱") ==
                     "re4 - to warm up/to heat up/hot (of weather)/heat/fervent"
    end

    test "Get the translation for 簡單", %{} do
      assert_value ChineseDict.translate("簡單") == "jian3 dan1 - simple/not complicated"
    end

    test "Get the translation for 簡單하다", %{} do
      assert_value ChineseDict.translate("簡單하다") == "jian3 dan1 - simple/not complicated"
    end

    # This word doesnt exist, so it should get two single translations and attach
    test "Get the translation for 熱戶", %{} do
      assert_value ChineseDict.translate("熱戶") ==
                     "re4 - to warm up/to heat up/hot (of weather)/heat/fervent AND hu4 - a household/door/family"
    end

    test "Get the translation for 荷蘭人", %{} do
      assert_value ChineseDict.translate("荷蘭人") ==
                     "He2 - Holland/the Netherlands/abbr. for 荷蘭|荷兰[He2 lan2]he2 - lotushe4 - to carry on one's shoulder or back/burden/responsibility AND Lan2 - surname Lan/abbr. for Lanzhou 蘭州|兰州[Lan2 zhou1], Gansulan2 - orchid (蘭花|兰花 Cymbidium goeringii)/fragrant thoroughwort (蘭草|兰草 Eupatorium fortunei)/lily magnolia (木蘭|木兰) AND ren2 - man/person/people/CL:個|个[ge4],位[wei4]"
    end

    test "Get the translation for non existing character", %{} do
      assert_value ChineseDict.translate("없다") == ""
    end

  end
end
