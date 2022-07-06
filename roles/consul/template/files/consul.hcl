# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

datacenter = "hz1"
data_dir = "/opt/consul"
log_file = "/var/log/consul/consul.log"

# only bind to the private addresses within 10.0.0.0/8
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"10.0.0.0/8\" | attr \"address\" }}"

# retry_join - continously try to join to a server at this IP
retry_join = ["10.0.0.10"]
