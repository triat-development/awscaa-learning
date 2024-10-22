
resource "aws_security_group" "ssh_admins" {
  name        = var.security_group_name
  description = "Allow SSH inbound traffic from specific IPs"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.ssh_admins.id
}
    