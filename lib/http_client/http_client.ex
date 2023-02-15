defmodule HttpMeta.HttpClient do
  @client_impl Application.compile_env(:http_meta, :http_client, HttpMeta.HttpClientImpl)

  @callback get_ip() :: {:ok, String.t()}

  def get_client() do
    @client_impl
  end

  defdelegate get_ip, to: @client_impl
end
