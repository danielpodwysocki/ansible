# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

datacenter = "hz1"

data_dir = "/opt/consul"


# Advertise addr - if you want to point clients to a different address than bind or LB.
#advertise_addr = "127.0.0.1"


# retry_join
retry_join = ["10.0.0.10"]
