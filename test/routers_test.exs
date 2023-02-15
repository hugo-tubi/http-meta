defmodule ComingSoonTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias HttpMeta.Router

  @opts Router.init([])

  import Mox

  setup :set_mox_from_context
  setup :verify_on_exit!

  test "should return 200" do
    HttpMeta.HttpClientMock
      |> expect(:get_ip, fn -> "1.2.3.4" end)

    url = "/http/ip/"
    conn = Router.call(conn(:get, url), @opts)

    assert conn.status == 200
    assert conn.resp_body == "Your IP Address: 1.2.3.4\n"
  end

end
