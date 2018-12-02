defmodule AnkikoreanWeb.PageController do
  use AnkikoreanWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", email: "", value: ""
  end
end
