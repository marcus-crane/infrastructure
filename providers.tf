# CLOUDFLARE_API_TOKEN set in backend environment
provider "cloudflare" {
    # Deprecated but worker routes don't support resource level account IDs yet
    # See https://github.com/cloudflare/terraform-provider-cloudflare/issues/1646
    account_id = var.cloudflare_account_id
}