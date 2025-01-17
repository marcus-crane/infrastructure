# A Records

## OVHCloud dedicated server
resource "cloudflare_record" "a-soup-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "soup.utf9k.net"
  content = "139.99.208.128"
  type    = "A"
  ttl     = 3600
}

resource "cloudflare_record" "a-wildcard-soup-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "*.soup.utf9k.net"
  content = "139.99.208.128"
  type    = "A"
  ttl     = 3600
}
