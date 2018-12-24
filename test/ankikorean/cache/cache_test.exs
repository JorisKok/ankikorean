defmodule Ankikorean.CacheTest do
  use AnkikoreanWeb.ConnCase

  test "Cache is settable" do
    result = Ankikorean.Cache.set("cache@example.com", %{"value" => "translation"})

    assert result == %{"value" => "translation"}
  end

  test "Cache is receivable" do
    result = Ankikorean.Cache.set("cache@example.com", %{"value" => "translation"})

    assert result = Ankikorean.Cache.get("cache@example.com")
  end

  test "Cache item is deletable via set" do
    Ankikorean.Cache.set("cache@example.com", %{"value" => "translation"})
    Ankikorean.Cache.set("cache@example.com", %{})
    assert {:found, %{}} == Ankikorean.Cache.get("cache@example.com")
  end

  test "Cache is clearable" do
    Ankikorean.Cache.set("cache@example.com", %{"value" => "translation"})
    Ankikorean.Cache.clear()

    assert {:not_found} == Ankikorean.Cache.get("cache@example.com")
  end
end
