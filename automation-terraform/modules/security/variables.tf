variable "ec2_security_group" {
  type = object({
    sg_name: string

    ingress: list(object({
      in_from_port: number
      in_to_port: number
      in_protocol: string
      in_cidr: list(string)
    }))
    egress: list(object({
      eg_from_port: number
      eg_to_port: number
      eg_protocol: string
      eg_cidr: list(string)
    }))
  })
}

variable "vpc_id" {
  type = string
}