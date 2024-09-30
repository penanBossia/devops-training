output "app_instance_ids" {
  value = aws_instance.app-instances[*].id
}