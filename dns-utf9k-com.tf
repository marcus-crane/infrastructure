resource "cloudflare_zone" "utf9k-com-zone" {
  account_id = var.cloudflare_account_id
  zone       = "utf9k.com"
}

resource "cloudflare_record" "a-utf9k-com" {
  zone_id = cloudflare_zone.utf9k-com-zone.id
  name    = "utf9k.com"
  proxied = true
  value   = "192.0.2.1"
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "a-www-utf9k-com" {
  zone_id = cloudflare_zone.utf9k-com-zone.id
  name    = "www.utf9k.com"
  proxied = true
  value   = "192.0.2.1"
  type    = "A"
  ttl     = 1
}

resource "cloudflare_ruleset" "utf9k_com_redirect" {
  zone_id = cloudflare_zone.utf9k-com-zone.id
  name    = "Redirect to utf9k.net"
  kind    = "zone"
  phase   = "http_request_dynamic_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          value = "https://utf9k.net"
        }
        preserve_query_string = false
      }
    }
    expression = "(http.host contains \"utf9k\")"
    enabled    = true
  }
}