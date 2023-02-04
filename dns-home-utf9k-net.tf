# A Records

## Synology NAS
resource "cloudflare_record" "a-home-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "home.utf9k.net"
  value   = "158.140.244.234"
  type    = "A"
  ttl     = 3600
}