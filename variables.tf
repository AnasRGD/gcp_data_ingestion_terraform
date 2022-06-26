variable "project_id" {
  description = "The project id of the GCP project"
  type = string
}


variable "bucket_prefix" {
  description = "The prefix given to the ingest buckets"
  type = string
}


variable "gcp_credentials" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
}