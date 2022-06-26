variable "bucket_prefix" {
  type    = string
  description = "The prefix of integration bucket names"
}


variable "terraform_service_account_email" {
  type = string
  description = "The email of the service account used by terraform"
}