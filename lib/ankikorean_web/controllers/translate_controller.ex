defmodule AnkikoreanWeb.TranslateController do
  use AnkikoreanWeb, :controller
  alias AnkikoreanWeb.Korean
  @moduledoc """
  Translate a korean word
  Use an email as identifier
  """

  @doc """
  Translate from Korean to English
  """
  def translate(conn, %{"email" => email, "korean" => value, "include_hanzi" => include_hanzi}) do
    case Korean.patch(email, value, include_hanzi) do
      nil -> conn
             |> put_status(404)
             |> render("index.json", status: :error, message: "Translation not found")
      data -> render conn, "index.json", status: :ok, data: data
    end
  end

  def translate(conn, %{"email" => email, "korean" => value}) do
    # Include hanzi by default
    translate(conn, %{"email" => email, "korean" => value, "include_hanzi" => "true"})
  end

  def translate(conn, _) do
    conn
    |> put_status(:unprocessable_entity)
    |> render("index.json", status: :error, message: "Please make sure email and search field are filled in")
  end

  @doc """
  Delete a word from our stored values for a selected email (identifier)
  """
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
