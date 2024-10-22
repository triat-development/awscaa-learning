
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

# Add variable for IAM instance profile name
variable "iam_instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}
    