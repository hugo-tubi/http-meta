defmodule HttpMeta.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    HttpMeta.Home.call(conn)
  end

  get "/http/ip/" do
    HttpMeta.HTTPIP.call(conn, [])
  end
end
