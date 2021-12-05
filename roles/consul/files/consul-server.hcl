# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

# datacenter
# This flag controls the datacenter in which the agent is running. If not provided,
# it defaults to "dc1". Consul has first-class support for multiple datacenters, but 
# it relies on proper configuration. Nodes in the same datacenter should be on a 
# single LAN.
datacenter = "hz1"

# data_dir
# This flag provides a data directory for the agent to store state. This is required
# for all agents. The directory should be durable across reboots. This is especially
# critical for agents that are running in server mode as they must be able to persist
# cluster state. Additionally, the directory must support the use of filesystem
# locking, meaning some types of mounted folders (e.g. VirtualBox shared folders) may
# not be suitable
data_dir = "/opt/consul"
log_file = "/var/log/consul/consul.log"


# ui
# Enables the built-in web UI server and the required HTTP routes.
ui_config{
  enabled = true
}
server = true

# Bind addr
# only bind to the private addresses within 10.0.0.0/8
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"10.0.0.0/8\" | attr \"address\" }}" 

# how many servers we expect in the cluster
bootstrap_expect=1

# encrypt
# Specifies the secret key to use for encryption of Consul network traffic. This key must
# be 32-bytes that are Base64-encoded. The easiest way to create an encryption key is to
# use consul keygen. All nodes within a cluster must share the same encryption key to
# communicate. The provided key is automatically persisted to the data directory and loaded
# automatically whenever the agent is restarted. This means that to encrypt Consul's gossip
# protocol, this option only needs to be provided once on each agent's initial startup
# sequence. If it is provided after Consul has been initialized with an encryption key,
# then the provided key is ignored and a warning will be displayed.
#encrypt = "..."

