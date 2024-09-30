locals {
  local_data = jsondecode(file("./config.json"))
}

module "network" {
  source = "./modules/network"
  default_vpc_id = "vpc-0b9e81d62f80c0daa"
  vpc_cidr = local.local_data.vpc_cidr
  subnets_cidr = local.local_data.subnets_cidr
  subnets_az = local.local_data.subnets_az
}

module "security" {
  source = "./modules/security"
  ec2_security_group = local.local_data.ec2_security_groups
  lb_security_group = local.local_data.lb_security_groups
  vpc_id = module.network.vpc_id
}

module "servers" {
  source = "./modules/servers"
  ec2_subnets_length = length(module.network.subnet_ids)
  ec2_instances = local.local_data.ec2_instances
  ec2_subnet_ids = module.network.subnet_ids
  ec2_sg_ids = [module.security.ec2_security_group_id]
}

module "gateway" {
  source = "./modules/gateway"
  lb_count = length(local.local_data.ec2_instances) > 1 ? 1 : 0
  lb_props = local.local_data.lb_props
  lb_sg_ids = [module.security.lb_security_group_id]
  lb_subnet_ids = module.network.subnet_ids

  lb_tg_props = local.local_data.lb_tg_props
  lb_tg_vpc_id = module.network.vpc_id
  lb_tg_att_count = length(local.local_data.ec2_instances) > 1 ? length(local.local_data.ec2_instances) : 0
  lb_tg_instance_ids = module.servers.app_instance_ids
}