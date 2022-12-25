terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "utf9k-net"

    workspaces {
      name = "infrastructure"
    }
  }
}
