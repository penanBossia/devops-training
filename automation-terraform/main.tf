locals {
  local_data = jsondecode(file("./config.json"))
}

module "network" {
  source = "./modules/network"
  vpc_cidr = local.local_data.vpc_cidr
  subnets_cidr = local.local_data.subnets_cidr
}

module "security" {
  source = "./modules/security"
  ec2_security_group = local.local_data.ec2_security_groups
  vpc_id = module.network.vpc_id
}

module "servers" {
  source = "./modules/servers"
  ec2_subnets_length = length(module.network.subnet_ids)
  ec2_instances = local.local_data.ec2_instances
  ec2_subnet_ids = module.network.subnet_ids
  ec2_sg_ids = [module.security.ec2_security_group_id]
}