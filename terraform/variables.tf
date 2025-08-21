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
variable "zone" {
  description = "The zone where the Google Compute Engine instance will be created."
  type        = string
  default     = "us-central1-a"
}
variable "services" {
  description = "List of Google Cloud services to enable for the project."
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "storage.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}
