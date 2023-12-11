# A Records

## Synology NAS
resource "cloudflare_record" "a-home-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "home.utf9k.net"
  value   = "103.193.138.188"
  type    = "A"
  ttl     = 3600
}

resource "cloudflare_record" "a-wildcard-home-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "*.home.utf9k.net"
  value   = "103.193.138.188"
  type    = "A"
  ttl     = 3600
}
