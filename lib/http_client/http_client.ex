defmodule HttpMeta.HttpClient do
  @callback get_ip() :: {:ok, String.t()}

  def get_ip() do
    impl = Application.get_env(:http_meta, :http_client, HttpMeta.HttpClientImpl)
    impl.get_ip()
  end
end
