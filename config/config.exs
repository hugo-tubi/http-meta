import Config

config :http_meta, HttpServer,
  ip: "localhost",
  port: 4001

import_config "#{Mix.env()}.exs"
