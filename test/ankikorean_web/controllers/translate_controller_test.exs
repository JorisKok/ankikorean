defmodule AnkikoreanWeb.TranslateControllerTest do
  use AnkikoreanWeb.ConnCase

  test "GET /v1/translate", %{conn: conn} do
    conn = get conn, "/v1/translate", %{"email" => "test@example.com", "korean" => "안녕하세요"}
    assert json_response(conn, 200) == %{
             "success" => %{
               "data" => %{
                 "안녕하세요" => "1.Hello 2.Greeting; 3.Hey"
               }
             }
           }
  end

  test "GET /v1/translate maintains state", %{conn: conn} do
    conn = get conn, "/v1/translate", %{"email" => "test@example.com", "korean" => "안녕하세요"}
    assert json_response(conn, 200) == %{
             "success" => %{
               "data" => %{
                 "안녕하세요" => "1.Hello 2.Greeting; 3.Hey"
               }
             }
           }

    conn = get conn, "/v1/translate", %{"email" => "test@example.com", "korean" => "중국어"}
    assert json_response(conn, 200) == %{
             "success" => %{
               "data" => %{
                 "안녕하세요" => "1.Hello 2.Greeting; 3.Hey",
                 "중국어" => "1.Hello 2.Greeting; 3.Hey"
               }
             }
           }
  end
end
