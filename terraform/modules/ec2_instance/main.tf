
variable "ami_id" {
  description = "AMI ID for launching the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to associate with EC2 instance"
  type        = string
}

variable "user_data_script" {
  description = "User data script to configure the EC2 instance"
  type        = string
}

resource "aws_instance" "my_ec2_instance" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  security_group_ids = [var.security_group_id]
  iam_instance_profile = aws_iam_instance_profile.my_instance_profile.name
  user_data         = var.user_data_script

  tags = {
    Name = "MyEC2Instance"
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.my_ec2_instance.public_ip
}
    