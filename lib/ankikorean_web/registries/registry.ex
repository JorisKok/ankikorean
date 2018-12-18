defmodule AnkikoreanWeb.Registry do
  @moduledoc false

  def start_link() do
    Registry.start_link(keys: :unique, name: AnkikoreanWeb.Registry)
  end
end
