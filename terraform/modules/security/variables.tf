variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created."
  type        = string
}

variable "project_name" {
  description = "Project name used for naming AWS resources."
  type        = string
}
