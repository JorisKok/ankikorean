defmodule Ankikorean.ChineseCacheTest do
  use AnkikoreanWeb.ConnCase
  import AssertValue

  @doc """
  Chinese cache contains all the dictionary entries from CEDICT via ETS for fast access
  """

  describe "Check that the cache is properly initiated on server start" do
    @tag :current
    test "Test if some values are available after initiating" do

      assert_value Ankikorean.ChineseCache.get("工作") ==
                     {:found,
                      "gong1 zuo4 - to work/(of a machine) to operate/job/work/task/CL:個|个[ge4],份[fen4],項|项[xiang4]"}

      assert_value Ankikorean.ChineseCache.get("龜頭") ==
                     {:found, "gui1 tou2 - head of a turtle/glans penis"}
      assert_value Ankikorean.ChineseCache.get("龟头") ==
                     {:found, "gui1 tou2 - head of a turtle/glans penis"}
      assert_value Ankikorean.ChineseCache.get("龟甲万") ==
                     {:found,
                      "Gui1 jia3 wan4 - Kikkoman, Japanese brand of soy sauce, food seasonings etc"}
      assert_value Ankikorean.ChineseCache.get("龜甲萬") ==
                     {:found,
                      "Gui1 jia3 wan4 - Kikkoman, Japanese brand of soy sauce, food seasonings etc"}

      # TODO fix this
      assert_value Ankikorean.ChineseCache.get("韓國") == {:not_found}
    end
  end

  describe "Basic caching functions" do
    test "Cache is settable" do
      result = Ankikorean.ChineseCache.set("cache@example.com", %{"value" => "translation"})

      assert_value result == %{"value" => "translation"}
    end
  end
end
