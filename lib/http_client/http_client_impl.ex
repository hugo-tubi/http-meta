defmodule HttpMeta.HttpClientImpl do
  def get_ip() do
    {:ok, response} = HTTPoison.get("https://hugo.wang/http/headers/")
    case Jason.decode(response.body) do
      {:ok, data} ->
        Map.get(data, "x-real-ip", "not-found")
      {:error, err} ->
        "error: #{inspect err}"
    end
  end
end
