defmodule HttpMeta.HTTPIP do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    conn = fetch_query_params(conn)
    ip = HttpMeta.HttpClient.get_ip()
    text = "Your IP Address: #{ip}\n"
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, text)
  end
end
