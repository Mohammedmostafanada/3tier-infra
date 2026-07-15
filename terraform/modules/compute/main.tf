#Frontend EC2 Instance (Nginx Web Server)
resource "aws_instance" "frontend" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.frontend_sg_id]
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}-frontend"
  }
}

#Backend EC2 Instance (Flask API)
resource "aws_instance" "backend" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_app_subnet_id
  vpc_security_group_ids = [var.backend_sg_id]
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}-backend"
  }
}

#DB EC2 Instance (MySQL)
resource "aws_instance" "database" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_db_subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}-database"
  }
}
