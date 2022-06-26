########################## GCS ########################
# Create location-to-bq dedicated service account
resource "google_service_account" "location-to-bq" {
  account_id   = "location-to-bq"
  display_name = "Service Account to run load_location_into_bq cloud function"
}

resource "google_project_iam_custom_role" "gcs_to_bq_role" {
  role_id     = "gcs_to_bq_function"
  title       = "GCS to BigQuery function customized role"
  description = "A customized IAM role for gcs to bq function"
  permissions = [
    "storage.objects.get", 
    "storage.objects.list",
    "bigquery.jobs.create", 
    "bigquery.jobs.get", 
    "bigquery.jobs.update", 
    "bigquery.jobs.delete",
    "bigquery.tables.create", 
    "bigquery.tables.get", 
    "bigquery.tables.getData",
    "bigquery.tables.update",
    "bigquery.tables.updateData"
  ]
}

# Grant gcs-to-bq service account adequate roles
resource "google_project_iam_member" "location_to_bq_permissions" {
  project = data.google_project.current_project.project_id
  role = google_project_iam_custom_role.gcs_to_bq_role.id
  member  = "serviceAccount:${google_service_account.location-to-bq.email}"
}


resource "google_service_account_iam_member" "location_to_bq_sa_user" {
  service_account_id = google_service_account.location_to_bq.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${var.terraform_service_account_email}"
}



##################################################
# Create location-to-bq dedicated service account

resource "google_service_account" "reservations_to_bq" {
  account_id   = "reservations_to_bq"
  display_name = "Service Account to run load_reservations_into_bq cloud function"
}

# Grant gcs-to-bq service account adequate roles
resource "google_project_iam_member" "reservations_to_bq_permissions" {
  project = data.google_project.current_project.project_id
  role = google_project_iam_custom_role.gcs_to_bq_role.id
  member  = "serviceAccount:${google_service_account.reservations_to_bq.email}"
}


resource "google_service_account_iam_member" "reservations_to_bq_sa_user" {
  service_account_id = google_service_account.reservations_to_bq.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${var.terraform_service_account_email}"
}