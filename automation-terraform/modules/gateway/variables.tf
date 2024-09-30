variable "lb_count" {
  type = number
}

variable "lb_sg_ids" {
  type = list(string)
}

variable "lb_subnet_ids" {
  type = list(string)
}

variable "lb_props" {
  type = object({
    lb_name: string
    lb_type: string
    lb_internal: bool
  })
}

variable "lb_tg_vpc_id" {
  type = string
}

variable "lb_tg_props" {
  type = object({
    lb_tg_name: string
    lb_tg_port: number
    lb_tg_proto: string
    lb_tg_type: string
  })
}

variable "lb_tg_att_count" {
  type = number
}

variable "lb_tg_instance_ids" {
  type = list(string)
}
