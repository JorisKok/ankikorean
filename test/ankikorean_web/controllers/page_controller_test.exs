defmodule AnkikoreanWeb.PageControllerTest do
  use AnkikoreanWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello Ankikorean!"
  end
end
