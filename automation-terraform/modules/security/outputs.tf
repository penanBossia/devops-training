output "ec2_security_group_id" {
  value = aws_security_group.app-ec2-sg.id
}

output "lb_security_group_id" {
  value = aws_security_group.app-lb-sg.id
}