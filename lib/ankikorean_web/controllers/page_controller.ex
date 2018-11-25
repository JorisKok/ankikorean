defmodule AnkikoreanWeb.PageController do
  use AnkikoreanWeb, :controller
  alias AnkikoreanWeb.KoreanEnglish

  def index(conn, _params) do
    render conn, "index.html", email: "", value: ""
  end

  def translate(conn, %{"email" => email, "korean" => value}) when email == "" do

    render conn, "index.html", email: "email can't be empty", value: ""
  end

  def translate(conn, %{"email" => email, "korean" => value}) when value == "" do

    render conn, "index.html", email: email, value: "value can't be empty"
  end

  def translate(conn, %{"email" => email, "korean" => value}) do
    #    KoreanEnglish.patch(email, value)

    render conn, "index.html", email: email, value: ""
  end
end
