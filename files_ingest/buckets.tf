resource "google_storage_bucket" "integration_bucket" {
  for_each = toset(local.integration_bucket_names)

  name          = each.value
  location      = "EU"

}
