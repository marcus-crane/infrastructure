resource "cloudflare_zone" "utf9k-net-zone" {
  account_id = var.cloudflare_account_id
  zone       = "utf9k.org"
}