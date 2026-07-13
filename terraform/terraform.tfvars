project_name = "3tier"
ami_id = "ami-091138d0f0d41ff90"
vpc_cidr = "10.0.0.0/16"



public_subnet_cidr      = "10.0.1.0/24"
private_app_subnet_cidr = "10.0.2.0/24"
private_db_subnet_cidr  = "10.0.3.0/24"

public_availability_zone      = "us-east-1a"
private_app_availability_zone = "us-east-1b"
private_db_availability_zone  = "us-east-1c"




key_name      = "your-key-name"
instance_type = "t3.micro"
