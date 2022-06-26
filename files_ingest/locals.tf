locals {
  integration_bucket_names = [for suffix in ["integration-in","integration-backup", "integration-error-backup"]: "${var.bucket_prefix}-${suffix}"]
}