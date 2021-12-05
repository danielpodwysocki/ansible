# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

datacenter = "hz1"
server = true

data_dir = "/opt/consul"
log_file = "/var/log/consul/consul.log"


# web ui
ui_config{
  enabled = true
}

# only bind to the private addresses within 10.0.0.0/8
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"10.0.0.0/8\" | attr \"address\" }}" 

# how many servers we expect there to be in the cluster
bootstrap_expect=1

