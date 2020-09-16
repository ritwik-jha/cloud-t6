resource "kubernetes_replication_controller" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      app = "wordpress"
    }
  }

  spec {
    replicas = 3
    selector = {
      app = "wordpress"
    }
    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }

      spec {
        container {
          image = "wordpress"
          name  = "wp"
        }
      }
    }
  }
}


resource "kubernetes_service" "wp-service" {
  metadata {
    name = "wp-service"
  }

  spec {
    selector = {
      app = "wordpress"
    }
  port {
    protocol = "TCP"
    port = 80
    target_port = 80
  }
  type = "NodePort"
  }
}
