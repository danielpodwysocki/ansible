# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

datacenter = "hz1"
data_dir = "/opt/consul"
log_file = "/var/log/consul/consul.log"

# only bind to the private addresses within {{ consul_subnet }}
bind_addr = {% raw %}"{{ GetPrivateInterfaces | include \"network\" \"{% endraw %}{{ consul_subnet }}{% raw %}\" | attr \"address\" }}"{% endraw %}

# retry_join - continously try to join to a server at this IP
retry_join = ["{{ consul_retry_join }}"]
