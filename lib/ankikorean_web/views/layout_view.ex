defmodule AnkikoreanWeb.LayoutView do
  use AnkikoreanWeb, :view

  def vue do
    case Application.get_env(:ankikorean, AnkikoreanWeb.Endpoint)[:debug_errors] do
      true -> "https://cdn.jsdelivr.net/npm/vue/dist/vue.js"
      _ -> "https://cdn.jsdelivr.net/npm/vue"
    end
  end
end
