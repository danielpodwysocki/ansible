# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

server = true

# web ui
ui_config{
  enabled = true
}

# how many servers we expect there to be in the cluster
bootstrap_expect=1

