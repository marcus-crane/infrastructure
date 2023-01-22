resource "cloudflare_pages_project" "dotfiles-utf9k-net" {
  account_id        = var.cloudflare_account_id
  name              = "dotfiles"
  production_branch = "main"
  build_config {
    destination_dir = "public"
    root_dir        = "/"
  }
  deployment_configs {
    preview {
      compatibility_date        = "2022-12-25"
      compatibility_flags       = []
      d1_databases              = {}
      durable_object_namespaces = {}
      environment_variables     = {}
      kv_namespaces             = {}
      r2_buckets                = {}
    }
    production {
      compatibility_date        = "2022-12-25"
      compatibility_flags       = []
      d1_databases              = {}
      durable_object_namespaces = {}
      environment_variables     = {}
      kv_namespaces             = {}
      r2_buckets                = {}
    }
  }
}

resource "cloudflare_pages_domain" "dotfiles-utf9k-net" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.dotfiles-utf9k-net.name
  domain       = "dotfiles.utf9k.net"
}