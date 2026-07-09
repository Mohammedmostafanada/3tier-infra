module "network" {
  source = "./modules/network"

  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr      = var.public_subnet_cidr
  private_app_subnet_cidr = var.private_app_subnet_cidr
  private_db_subnet_cidr  = var.private_db_subnet_cidr

  public_availability_zone      = var.public_availability_zone
  private_app_availability_zone = var.private_app_availability_zone
  private_db_availability_zone  = var.private_db_availability_zone
}
