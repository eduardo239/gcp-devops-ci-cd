variable "project_id" {
  description = "The ID of the project where resources will be created."
  type        = string
  default     = "learn-gcp-terraform-469711"
}
variable "region" {
  description = "The region where resources will be created."
  type        = string
  default     = "us-central1"
}

variable "credentials_file" {
  description = "Path to the Google Cloud service account credentials file."
  type        = string
  default     = "learn-gcp-terraform-469711-8b0f1efd1096.json"
}

variable "zone" {
  description = "The zone where the Google Compute Engine instance will be created."
  type        = string
  default     = "us-central1-a"
}
