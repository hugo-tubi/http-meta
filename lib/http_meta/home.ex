defmodule HttpMeta.Home do
  import Plug.Conn

  def call(conn) do
    conn
    |> send_resp(404, "Please check /http/ip/ instead")
  end
end
