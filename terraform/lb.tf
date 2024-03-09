resource "yandex_lb_network_load_balancer" "foo" {
  name = "reddit-app-lb"

  listener {
    name = "reddit-app-listener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.my-target-group.id}"

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/ping"
      }
    }
  }
}
