
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID to launch the EC2 instance"
  default     = "ami-06b21ccaeff8cd686"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "security_group_name" {
  description = "Name of the security group"
  default     = "SSHAdmins"
}

variable "allowed_ips" {
  description = "IP addresses allowed to SSH"
  type        = list(string)
  default     = ["108.69.57.201/32", "24.177.229.15/32"]
}

variable "iam_role_name" {
  description = "Name of the IAM role to attach to EC2"
  default     = "EC2InstanceAccessRole"
}

variable "iam_groups" {
  description = "IAM groups allowed to access the EC2 instance"
  type        = list(string)
  default     = ["AdminBots", "AdminPeople"]
}
    