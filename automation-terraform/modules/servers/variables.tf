variable "ec2_instances" {
  type = list(object({
    ec2_ami: string
    ec2_instance_type: string
  }))
}

variable "ec2_subnets_length" {
  type = number
}

variable "ec2_subnet_ids" {
  type = list(string)
}

variable "ec2_sg_ids" {
  type = list(string)
}