# Full configuration options can be found at https://www.nomadproject.io/docs/configuration
log_file = "/var/log/nomad.log"
data_dir = "/opt/nomad/data"
# https://github.com/hashicorp/nomad/issues/9257
# once this PR gets merged, we're good to go: https://github.com/hashicorp/nomad/pull/11582
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"10.0.0.0/8\" | attr \"address\" }}"

# The server will be discovered via Consul
client {
  enabled       = true
}


consul {
  address = "127.0.0.1:8500"
}

