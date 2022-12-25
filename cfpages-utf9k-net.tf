resource "cloudflare_pages_project" "utf9k-net" {
  account_id        = var.cloudflare_account_id
  name              = "utf9k"
  production_branch = "main"
  build_config {
    destination_dir = "public"
    root_dir        = "/"
  }
  deployment_configs {
    preview {
        compatibility_date = "2022-12-25"
        compatibility_flags = []
        d1_databases = {}
        durable_object_namespaces = {}
        environment_variables = {}
        kv_namespaces = {}
        r2_buckets = {}
    }
    production {
        compatibility_date = "2022-12-25"
        compatibility_flags = []
        d1_databases = {}
        durable_object_namespaces = {}
        environment_variables = {}
        kv_namespaces = {}
        r2_buckets = {}
    }
  }
}

resource "cloudflare_pages_domain" "utf9k-net" {
  account_id   = var.cloudflare_account_id
  project_name = "utf9k"
  domain       = "utf9k.net"
}

resource "cloudflare_pages_domain" "www-utf9k-net" {
  account_id   = var.cloudflare_account_id
  project_name = "utf9k"
  domain       = "www.utf9k.net"
}

resource "cloudflare_worker_script" "statistician" {

  name    = "statistician"
  content = file("scripts/statistician.js")
}

resource "cloudflare_worker_route" "utf9k" {
  zone_id     = "2117c58a86ea651fc35e585881e42c6e"
  pattern     = "*.utf9k.net/*"
  script_name = cloudflare_worker_script.statistician.name
}
