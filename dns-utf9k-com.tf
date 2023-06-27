resource "cloudflare_zone" "utf9k-com-zone" {
  account_id = var.cloudflare_account_id
  zone       = "utf9k.com"
}