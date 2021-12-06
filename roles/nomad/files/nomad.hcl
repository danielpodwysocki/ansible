# Full configuration options can be found at https://www.nomadproject.io/docs/configuration
log_file = "/var/log/nomad.log"
data_dir = "/opt/nomad/data"
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"10.0.0.0/8\" | attr \"address\" }}"

# The server will be discovered via Consul
client {
  enabled       = true
}


consul {
  address = "127.0.0.1:8500"
}

