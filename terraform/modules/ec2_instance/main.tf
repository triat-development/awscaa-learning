
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_instance" "my_ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile_name
  user_data              = var.user_data_script
  key_name               = aws_key_pair.my_key_pair.key_name

  tags = {
    Name = "MyEC2Instance"
  }
}

# Save the private key to a local file on Windows
resource "local_file" "private_key" {
  filename = "C:/Users/Ulric/id_rsa"  # Replace with your actual Windows username
  content  = tls_private_key.ssh_key.private_key_pem
  file_permission = "0600"
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.my_ec2_instance.public_ip
}

output "private_key_location" {
  description = "Location of the private key on your local machine"
  value       = local_file.private_key.filename
}

output "instance_public_dns" {
  description = "The public DNS name of the EC2 instance"
  value       = aws_instance.my_ec2_instance.public_dns
}
