defmodule AnkikoreanWeb.ExportControllerTest do
  use AnkikoreanWeb.ConnCase


  test "GET /v1/export", %{conn: conn} do
    Ankikorean.Cache.set("export@example.com", %{"덕일" => "1.Germany", "네덜란드" => "1.Netherlands"})

    conn = get conn, "/v1/export/", %{"email" => "export@example.com"}

    assert response(conn, 200) == "네덜란드,1.Netherlands\r\n덕일,1.Germany\r\n"
    assert get_resp_header(conn, "content-type") == ["text/csv; charset=utf-8; charset=utf-8"]
  end

  test "GET /v1/export when no data is stored yet", %{conn: conn} do
    conn = get conn, "/v1/export/", %{"email" => "export-no-data@example.com"}

    assert json_response(conn, 200) == %{
             "error" => %{
               "message" => "No data found"
             }
           }
  end

  test "GET /v1/export when no email is give", %{conn: conn} do
    conn = get conn, "/v1/export/", %{}

    assert json_response(conn, 200) == %{
             "error" => %{
               "message" => "No email found"
             }
           }
  end
end
