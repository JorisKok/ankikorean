defmodule AnkikoreanWeb.TranslateView do
  use AnkikoreanWeb, :view

  def render("index.json", %{status: :ok, data: data}) do
    %{
      "success" => %{
        "data" => data
      }
    }
  end

  def render("index.json", %{status: :error, message: message}) do
    %{
      "error" => %{
        "message" => message
      }
    }
  end
end
