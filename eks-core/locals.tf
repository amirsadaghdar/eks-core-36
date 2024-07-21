locals {
  name   = var.cluster_name
  region = var.cluster_region

  vpc_cidr = var.vpc_cidr
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = var.tags

}