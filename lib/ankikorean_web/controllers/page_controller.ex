defmodule AnkikoreanWeb.PageController do
  use AnkikoreanWeb, :controller
  @moduledoc """
  The home page
  """
  def index(conn, _params) do
    render conn, "index.html", email: "", value: ""
  end
end
