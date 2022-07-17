# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

server = true

# web ui
ui_config{
  enabled = true
}

# how many servers we expect there to be in the cluster
bootstrap_expect=1

client_addr="127.0.0.1  {% raw %}{{ GetPrivateInterfaces | include \"network\" \"{% endraw %}{{ consul_subnet }}{% raw %}\" | attr \"address\" }}{% endraw %}"

