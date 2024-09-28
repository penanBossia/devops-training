# Ce module pour : la gestion du réseau
resource "aws_vpc" "app-vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "app-subnets" {
  count = length(var.subnets_cidr)
  vpc_id            = aws_vpc.app-vpc.id
  cidr_block       = var.subnets_cidr[count.index]
  #map_public_ip_on_launch = false # aucune adresse IP publique ne sera attribuée aux instances EC2 de ce subnet
}