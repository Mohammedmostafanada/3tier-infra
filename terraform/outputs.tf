output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_app_subnet_id" {
  value = module.network.private_app_subnet_id
}

output "private_db_subnet_id" {
  value = module.network.private_db_subnet_id
}

output "frontend_public_ip" {
  description = "The public IP address of the frontend server"
  value       = module.compute.frontend_public_ip
}

output "backend_private_ip" {
  description = "The private IP address of the backend server"
  value       = module.compute.backend_private_ip
}

output "database_private_ip" {
  description = "The private IP address of the database server"
  value       = module.compute.database_private_ip
}
