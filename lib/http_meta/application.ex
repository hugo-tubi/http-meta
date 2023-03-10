defmodule HttpMeta.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    sinfo = Application.get_env(:http_meta, HttpServer)

    children = [
      # Starts a worker by calling: HttpMeta.Worker.start_link(arg)
      # {HttpMeta.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: HttpMeta.Router, options: [port: sinfo[:port]]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HttpMeta.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
