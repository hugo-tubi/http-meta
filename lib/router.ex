defmodule HttpMeta.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/http/ip/" do
    HttpMeta.HTTPIP.call(conn, [])
  end
end
