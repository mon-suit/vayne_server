use Mix.Config

config :cipher, keyphrase:   "00000000000000000000000000000000",
                ivphrase:    "00000000000000000000000000000000",
                magic_token: "vayne"

config :vayne_server, area: :idc_foo
config :vayne_server, center_addr: "http://127.0.0.1:4000"
config :vayne_server, load_timeout: :timer.seconds(10)

config :vayne, groups: [:from_center]
config :vayne, ring: :ring_vayne

config :libring,
  rings: [
    ring_vayne:
    [
      monitor_nodes: true,
      node_blacklist: [~r/^remsh.*$/, ~r/_maint_/]
    ]
  ]

import_config "metric.exs"
import_config "schedule.exs"
