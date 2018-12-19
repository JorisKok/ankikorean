defmodule AnkikoreanWeb.ExportView do
  use AnkikoreanWeb, :view

  def render("export.json", %{status: :error, message: message}) do
    %{
      "error" => %{
        "message" => message
      }
    }
  end
end
