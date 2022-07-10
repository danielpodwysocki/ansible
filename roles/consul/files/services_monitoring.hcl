services {
  name = "node_exporter"
  tags = ["node_exporter", "prometheus"]
  port = 9100
}

services {
  name = "cadvisor"
  tags = ["cadvisor", "prometheus"]
  port = 8080
}

