defmodule AnkikoreanWeb.ExportController do
  use AnkikoreanWeb, :controller
  @moduledoc """
  Exports the translations
  """


  @doc """
  Export to CSV format
  """
  def export(conn, %{"email" => email}) do
    case Ankikorean.Cache.get(email) do
      {:not_found} ->
        render conn, "export.json", status: :error, message: "No data found"
      {:found, data} ->
        conn
        |> put_resp_content_type("text/csv; charset=utf-8")
        |> put_resp_header("content-disposition", "attachment; filename=\"AnkiKoreanExport.csv\"")
        |> send_resp(200, csv(data))
    end
  end

  def export(conn, %{}) do
    render conn, "export.json", status: :error, message: "No email found"
  end

  defp csv(data) do
    data
    |> Enum.map(fn {key, value} -> [key, value]  end)
    |> CSV.encode
    |> Enum.to_list
    |> to_string
  end
end
