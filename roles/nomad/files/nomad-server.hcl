# Full configuration options can be found at https://www.nomadproject.io/docs/configuration
log_file = "/var/log/nomad.log"
data_dir = "/opt/nomad/data"
# only bind to private addresses within 10.0.0.0/8
bind_addr = "{{ GetPrivateInterfaces | sort \"default\" | join \"address\" \" \" }}"
 

server {
  enabled = true
  bootstrap_expect = 1
}

client {
  enabled = true
  servers = ["127.0.0.1"]
}
