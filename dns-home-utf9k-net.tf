# A Records

## Synology NAS
resource "cloudflare_record" "a-home-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "home.utf9k.net"
  content = "118.67.199.70"
  type    = "A"
  ttl     = 3600
}

resource "cloudflare_record" "a-wildcard-home-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "*.home.utf9k.net"
  content = "118.67.199.70"
  type    = "A"
  ttl     = 3600
}
