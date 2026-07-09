#######################################
# Network Configuration
#######################################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_app_subnet_cidr" {
  description = "CIDR block for the private application subnet"
  type        = string
}

variable "private_db_subnet_cidr" {
  description = "CIDR block for the private database subnet"
  type        = string
}

#######################################
# Availability Zones
#######################################

variable "public_availability_zone" {
  description = "Availability Zone for the public subnet"
  type        = string
}

variable "private_app_availability_zone" {
  description = "Availability Zone for the private application subnet"
  type        = string
}

variable "private_db_availability_zone" {
  description = "Availability Zone for the private database subnet"
  type        = string
}
