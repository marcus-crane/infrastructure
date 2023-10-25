resource "cloudflare_zone" "utf9k-net-zone" {
  account_id = var.cloudflare_account_id
  zone       = "utf9k.net"
}

# CNAME records

## Web
resource "cloudflare_record" "cname-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "utf9k.net"
  proxied = true
  value   = cloudflare_pages_project.utf9k-net.subdomain
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "cname-b-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "b.utf9k.net"
  value   = "utf9k.b-cdn.net"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "cname-dotfiles-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "dotfiles.utf9k.net"
  proxied = true
  value   = cloudflare_pages_project.dotfiles-utf9k-net.subdomain
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "cname-gunslinger-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "gunslinger.utf9k.net"
  value   = "gunslinger.fly.dev"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "cname-img-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "img.utf9k.net"
  value   = "utf9k-img.b-cdn.net"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "cname-october-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "october.utf9k.net"
  proxied = true
  value   = cloudflare_pages_project.october-utf9k-net.subdomain
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "cname-towing-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "towing.utf9k.net"
  proxied = true
  value   = cloudflare_pages_project.towing-utf9k-net.subdomain
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "cname-www-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "www.utf9k.net"
  proxied = true
  value   = "utf9k.net"
  type    = "CNAME"
  ttl     = 1
}

## Mail

resource "cloudflare_record" "cname-mail-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "mail.utf9k.net"
  value   = "app.fastmail.com"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "cname-fm1-domainkey-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "fm1._domainkey.utf9k.net"
  value   = "fm1.utf9k.net.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "cname-fm2-domainkey-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "fm2._domainkey.utf9k.net"
  value   = "fm2.utf9k.net.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "cname-fm3-domainkey-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "fm3._domainkey.utf9k.net"
  value   = "fm3.utf9k.net.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "cname-mesmtp-domainkey-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "mesmtp._domainkey.utf9k.net"
  value   = "mesmtp.utf9k.net.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 3600
}

# MX records

resource "cloudflare_record" "mx-smtp10-utf9k-net" {
  zone_id  = cloudflare_zone.utf9k-net-zone.id
  name     = "utf9k.net"
  value    = "in1-smtp.messagingengine.com"
  priority = 10
  type     = "MX"
  ttl      = 3600
}

resource "cloudflare_record" "mx-smtp20-utf9k-net" {
  zone_id  = cloudflare_zone.utf9k-net-zone.id
  name     = "utf9k.net"
  value    = "in2-smtp.messagingengine.com"
  priority = 20
  type     = "MX"
  ttl      = 3600
}

# SRV records

resource "cloudflare_record" "srv-caldav-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_caldav._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_caldav"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

resource "cloudflare_record" "srv-caldavs-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_caldavs._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_caldavs"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 1
    port     = 443
    target   = "caldav.fastmail.com"
  }
}

resource "cloudflare_record" "srv-carddav-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_carddav._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_carddav"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

resource "cloudflare_record" "srv-carddavs-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_carddavs._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_carddavs"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 1
    port     = 443
    target   = "carddav.fastmail.com"
  }
}

resource "cloudflare_record" "srv-imap-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_imap._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_imap"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

resource "cloudflare_record" "srv-imaps-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_imaps._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_imaps"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 1
    port     = 993
    target   = "imap.fastmail.com"
  }
}

resource "cloudflare_record" "srv-jmap-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_jmap._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_jmap"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 1
    port     = 443
    target   = "jmap.fastmail.com"
  }
}

resource "cloudflare_record" "srv-pop3-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_pop3._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_pop3"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

resource "cloudflare_record" "srv-pop3s-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_pop3s._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_pop3s"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 10
    weight   = 1
    port     = 995
    target   = "pop.fastmail.com"
  }
}

resource "cloudflare_record" "srv-submission-tcp-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_submission._tcp.utf9k.net"
  type    = "SRV"

  data {
    service  = "_submission"
    proto    = "_tcp"
    name     = "utf9k.net"
    priority = 0
    weight   = 1
    port     = 587
    target   = "smtp.fastmail.com"
  }
}

# TXT records

resource "cloudflare_record" "txt-acme-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_acme-challenge.utf9k.net"
  value   = "utf9k.net.6139j.flydns.net"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-acme-www-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_acme-challenge.www.utf9k.net"
  value   = "www.utf9k.net.6139j.flydns.net."
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-spf-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "utf9k.net"
  value   = "v=spf1 include:spf.messagingengine.com -all"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-spf-wildcard-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "*.utf9k.net"
  value   = "v=spf1 -all"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-keybase-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "utf9k.net"
  value   = "keybase-site-verification=3Otbmwt5ONpRiIpZVcBQKSKNJGfuA0PFNYFxc5d88XI"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-google1-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "utf9k.net"
  value   = "google-site-verification=oU0N55oEkyi5hYWzzQNZwdBmCwDr9Q8np0PJ2ISplH0"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-google2-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "utf9k.net"
  value   = "google-site-verification=7XQmc_jmbYCEvj_SYEgLCZj-8XBYcdK2RykDlZH2lns"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-greeting-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "utf9k.net"
  value   = "Poking around? Feel free to email me at dns@utf9k.net"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-dmarc-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_dmarc.utf9k.net"
  value   = "v=DMARC1;p=reject;sp=reject;pct=100;aspf=r;rua=mailto:re+qlec0r9rume@dmarc.postmarkapp.com;"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "txt-atproto-utf9k-net" {
  zone_id = cloudflare_zone.utf9k-net-zone.id
  name    = "_atproto.utf9k.net"
  value   = "did=did:plc:go4cv3ofuhkmaxbwxlxqwx7v"
  type    = "TXT"
  ttl     = 3600
}
