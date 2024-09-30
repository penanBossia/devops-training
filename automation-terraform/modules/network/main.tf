# Ce module pour : la gestion du réseau
resource "aws_subnet" "app-subnets" {
  count = length(var.subnets_cidr)
  #vpc_id            = aws_vpc.app-vpc.id
  vpc_id            = var.default_vpc_id
  cidr_block       = var.subnets_cidr[count.index]
  availability_zone = var.subnets_az[count.index]
  #map_public_ip_on_launch = false # aucune adresse IP publique ne sera attribuée aux instances EC2 de ce subnet
}