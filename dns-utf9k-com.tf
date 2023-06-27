resource "cloudflare_zone" "utf9k-com-zone" {
  account_id = var.cloudflare_account_id
  zone       = "utf9k.com"
}

# CNAME records

resource "cloudflare_record" "cname-utf9k-com" {
  zone_id = cloudflare_zone.utf9k-com-zone.id
  name    = "utf9k.net"
  proxied = true
  value   = cloudflare_pages_project.utf9k-net.subdomain
  type    = "CNAME"
  ttl     = 1
}