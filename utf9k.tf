resource "cloudflare_zone" "utf9k-zone" {
  account_id = "8e782a355544971b192db9e75d789dca"
  zone       = "utf9k.net"
}

# CNAME records
resource "cloudflare_record" "utf9k-net" {
  zone_id = cloudflare_zone.utf9k-zone.id
  name    = "utf9k.net"
  value   = "nervous-elion-5370f7.netlify.app."
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "www-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-zone.id
  name    = "www.utf9k.net"
  value   = "nervous-elion-5370f7.netlify.app."
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "october-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-zone.id
  name    = "october.utf9k.net"
  value   = "friendly-saha-809ec9.netlify.app."
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "towing-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-zone.id
  name    = "towing.utf9k.net"
  value   = "superlative-nougat-842bb4.netlify.app."
  type    = "CNAME"
  ttl     = 3600
}

# MX records