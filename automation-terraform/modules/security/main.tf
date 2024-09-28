# Ce module pour : les acces securises avec les pare-feu
resource "aws_security_group" "app-ec2-sg" {
  name = var.ec2_security_group.sg_name
  vpc_id = var.vpc_id

  dynamic ingress {
    for_each = var.ec2_security_group.ingress
    content {
      from_port = ingress.value.in_from_port
      protocol = ingress.value.in_protocol
      to_port = ingress.value.in_to_port
      cidr_blocks = ingress.value.in_cidr
    }
  }

  dynamic egress {
    for_each = var.ec2_security_group.egress
    content {
      from_port = egress.value.eg_from_port
      protocol = egress.value.eg_protocol
      to_port = egress.value.eg_to_port
      cidr_blocks = egress.value.eg_cidr
    }
  }

}