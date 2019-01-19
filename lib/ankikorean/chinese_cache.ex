defmodule Ankikorean.ChineseCache do
  @moduledoc """
  Get the chinese search results from cache
  """

  def start_link(opts \\ []) do
    result = GenServer.start_link(__MODULE__, [], opts)

    create_chinese_dictionary_entries_from_dictionary_file()

    result
  end

  defp create_chinese_dictionary_entries_from_dictionary_file() do
    File.stream!("priv/static/dict/cedict_1_0_ts_utf-8_mdbg.txt")
    |> Enum.map(&(add_entry_to_cache(&1)))
  end

  defp add_entry_to_cache(entry) do
    case Regex.named_captures(
           ~r/(?<traditional>.+?) (?<simplified>.+?) \[(?<pinyin>.+)\] \/(?<translation>.+)(\/\n)/u,
           entry
         ) do
      %{
        "traditional" => traditional,
        "simplified" => simplified,
        "pinyin" => pinyin,
        "translation" => translation
      } ->
        set(simplified, "#{pinyin} - #{translation}")
        set(traditional, "#{pinyin} - #{translation}")
      _ -> nil # Empty lines come here
    end

  end

  def get(chinese) do
    case GenServer.call(__MODULE__, {:get, chinese}) do
      [] -> {:not_found}
      [{_email, result}] -> {:found, result}
    end
  end

  def set(chinese, value) do
    GenServer.call(__MODULE__, {:set, chinese, value})
    value
  end

  # Genserver callbacks

  def handle_call({:get, chinese}, _from, state) do
    %{ets_table_name: ets_table_name} = state
    result = :ets.lookup(ets_table_name, chinese)
    {:reply, result, state}
  end

  def handle_call({:set, chinese, value}, _from, state) do
    %{ets_table_name: ets_table_name} = state

    case :ets.insert_new(ets_table_name, {chinese, value}) do
      true -> true
      false ->
        # Look up old one
        [{_chinese, translation}] = :ets.lookup(ets_table_name, chinese)

        # Overwrite with combined
        :ets.insert(ets_table_name, {chinese, "#{translation} AND #{value}"})
    end

    {:reply, value, state}
  end

  def init(_) do
    :ets.new(:chinese_cache_table, [:named_table, :set, :private])

    {:ok, %{log_limit: 10000, ets_table_name: :chinese_cache_table}}
  end

end
