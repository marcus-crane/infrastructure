# A Records

resource "cloudflare_record" "a-khindex-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "khindex.utf9k.net"
  value   = "5.78.105.134"
  type    = "A"
  ttl     = 3600
}