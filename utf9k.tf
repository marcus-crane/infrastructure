data "cloudflare_zone" "utf9k-zone" {
  name = "utf9k.net"
}

resource "cloudflare_record" "test" {
  zone_id = data.cloudflare_zone.utf9k-zone.id
  name    = "toot"
  value   = "192.168.0.1"
  type    = "A"
  ttl     = 3600
}
