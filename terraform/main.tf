
provider "aws" {
  region = var.aws_region
}

# Module to create security group
module "security_group" {
  source            = "./modules/security_group"
  security_group_name = var.security_group_name
  allowed_ips         = var.allowed_ips
}

# Module to create an EC2 instance
module "ec2_instance" {
  source              = "./modules/ec2_instance"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  security_group_id   = module.security_group.security_group_id
  user_data_script    = file("${path.module}/scripts/user_data.sh")
  iam_instance_profile_name = module.iam_role.iam_instance_profile_name
}

# Module to configure IAM role and policies for the instance
module "iam_role" {
  source          = "./modules/iam_role"
  iam_role_name   = var.iam_role_name
  iam_groups      = var.iam_groups
}

module "route53_record" {
  source           = "./modules/route53_record"
  hosted_zone_name = "triat-development-studios.net"
  record_name      = "devbox.triat-development-studios.net"
  record_target    = module.ec2_instance.instance_public_dns
}

# Outputs
output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_instance.instance_public_ip
}
    