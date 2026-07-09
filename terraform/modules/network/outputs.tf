output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_app_subnet_id" {
  description = "The ID of the private application subnet"
  value       = aws_subnet.private_app.id
}

output "private_db_subnet_id" {
  description = "The ID of the private database subnet"
  value       = aws_subnet.private_db.id
}
