output "frontend_sg_id" {
  description = "Frontend security group ID"
  value       = aws_security_group.frontend_sg.id
}

output "backend_sg_id" {
  description = "Backend security group ID"
  value       = aws_security_group.backend_sg.id
}

output "db_sg_id" {
  description = "Database security group ID"
  value       = aws_security_group.database_sg.id
}
