resource "google_storage_bucket" "storage" {
  name          = var.name
  location      = "EU"
  storage_class = "MULTI_REGIONAL"
  force_destroy = true

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
}