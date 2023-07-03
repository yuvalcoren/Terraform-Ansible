locals {
  name                       = var.name
  cidr_block                 = var.vpc_cidr_block
  public_subnets_cidr_block  = var.public_subnets_cidr_block
  availability_zones         = var.availability_zones
  scurity_access             = ["0.0.0.0/0"]

}