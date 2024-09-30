variable "default_vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnets_cidr" {
  type = list(string)
}

variable "subnets_az" {
  type = list(string)
}