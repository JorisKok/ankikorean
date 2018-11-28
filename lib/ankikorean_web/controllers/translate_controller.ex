defmodule AnkikoreanWeb.TranslateController do
  use AnkikoreanWeb, :controller
  alias AnkikoreanWeb.KoreanEnglish

  def translate(conn, %{"email" => email, "korean" => value}) do
    #    KoreanEnglish.patch(email, value)

    render conn, "index.json", status: :ok, data: %{"search term": "answer"}
  end

  def translate(conn, _) do

    render conn, "index.json", status: :error, message: "Please make sure email and search field are filled"
  end

end
