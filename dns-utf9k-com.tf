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

resource "cloudflare_record" "txt-spf-utf9k-com" {
  zone_id = cloudflare_zone.utf9k-com-zone.id
  name    = "utf9k.com"
  value   = "v=spf1 -all"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-spf-wildcard-utf9k-com" {
  zone_id = cloudflare_zone.utf9k-com-zone.id
  name    = "*.utf9k.com"
  value   = "v=spf1 -all"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-dmarc-utf9k-com" {
  zone_id = cloudflare_zone.utf9k-com-zone.id
  name    = "_dmarc.utf9k.com"
  value   = "v=DMARC1;p=reject;sp=reject;adkim=s;aspf=s;rua=mailto:admin@utf9k.net;"
  type    = "TXT"
  ttl     = 3600
}
