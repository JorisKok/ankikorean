defmodule AnkikoreanWeb.TranslateController do
  use AnkikoreanWeb, :controller
  alias AnkikoreanWeb.Korean

  def translate(conn, %{"email" => email, "korean" => value}) do
    data = Korean.patch(email, value)

    render conn, "index.json", status: :ok, data: data
  end

  def translate(conn, _) do

    render conn, "index.json", status: :error, message: "Please make sure email and search field are filled"
  end

end
