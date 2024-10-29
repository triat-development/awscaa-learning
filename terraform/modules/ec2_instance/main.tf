
resource "aws_instance" "my_ec2_instance" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  vpc_security_group_ids = [var.security_group_id]  # Corrected from security_group_ids to vpc_security_group_ids
  iam_instance_profile = var.iam_instance_profile_name
  user_data         = var.user_data_script

  tags = {
    Name = "MyEC2Instance"
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.my_ec2_instance.public_ip
}
