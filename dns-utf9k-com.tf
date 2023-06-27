resource "cloudflare_zone" "utf9k-com-zone" {
  account_id = var.cloudflare_account_id
  zone       = "utf9k.com"
}

# CNAME records

resource "cloudflare_record" "cname-utf9k-com" {
  zone_id = cloudflare_zone.utf9k-com-zone.id
  name    = "utf9k.com"
  proxied = true
  value   = "utf9k.net"
  type    = "CNAME"
  ttl     = 1
}