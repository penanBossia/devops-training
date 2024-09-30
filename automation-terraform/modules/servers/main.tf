# Ce module pour : la gestion des servers
resource "aws_instance" "app-instances" {
  count = length(var.ec2_instances)

  ami = var.ec2_instances[count.index].ec2_ami
  instance_type = var.ec2_instances[count.index].ec2_instance_type
  subnet_id = var.ec2_subnet_ids[count.index]
  vpc_security_group_ids = var.ec2_sg_ids
  user_data = templatefile("./scripts/init.tftpl", {instance_number = count.index + 1})
}