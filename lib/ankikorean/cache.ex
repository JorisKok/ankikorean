defmodule Ankikorean.Cache do
  @moduledoc false

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def get(email) do
    case GenServer.call(__MODULE__, {:get, email}) do
      [] -> {:not_found}
      [{_email, result}] -> {:found, result}
    end
  end

  def set(email, values) do
    GenServer.call(__MODULE__, {:set, email, values})
    values
  end

  # Genserver callbacks

  def handle_call({:get, email}, _from, state) do
    %{ets_table_name: ets_table_name} = state
    result = :ets.lookup(ets_table_name, email)
    {:reply, result, state}
  end

  def handle_call({:set, email, values}, _from, state) do
    %{ets_table_name: ets_table_name} = state
    true = :ets.insert(ets_table_name, {email, values})
    {:reply, values, state}
  end

  def init(_) do
    :ets.new(:cache_table, [:named_table, :set, :private])

    {:ok, %{log_limit: 10000, ets_table_name: :cache_table}}
  end

end
