defmodule AnkikoreanWeb.TranslateController do
  use AnkikoreanWeb, :controller
  alias AnkikoreanWeb.Korean

  def translate(conn, %{"email" => email, "korean" => value}) do
    data = Korean.patch(email, value)

    render conn, "index.json", status: :ok, data: data
  end

  def translate(conn, _) do
    conn
    |> put_status(:unprocessable_entity)
    |> render("index.json", status: :error, message: "Please make sure email and search field are filled in")
  end

  def delete(conn, %{"email" => email, "korean" => value}) do
    data = Korean.delete(email, value)

    render conn, "index.json", status: :ok, data: data
  end

  def delete(conn, _) do
    conn
    |> put_status(:unprocessable_entity)
    |> render("index.json", status: :error, message: "Please make sure email is filled in")
  end
end
