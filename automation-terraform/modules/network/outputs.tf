output "vpc_id" {
  #value = aws_vpc.app-vpc.id
  #value = "vpc-0b9e81d62f80c0daa"
  value = var.default_vpc_id
}

output "subnet_ids" {
  value = aws_subnet.app-subnets[*].id
}