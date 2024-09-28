output "vpc_id" {
  value = aws_vpc.app-vpc.id
}

output "subnet_ids" {
  value = aws_subnet.app-subnets[*].id
}