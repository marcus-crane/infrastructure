resource "cloudflare_zone" "utf9k-org-zone" {
  account_id = var.cloudflare_account_id
  zone       = "utf9k.org"
}

# CNAME records

resource "cloudflare_record" "cname-utf9k-org" {
  zone_id = cloudflare_zone.utf9k-org-zone.id
  name    = "utf9k.org"
  proxied = true
  value   = "utf9k.net"
  type    = "CNAME"
  ttl     = 1
}