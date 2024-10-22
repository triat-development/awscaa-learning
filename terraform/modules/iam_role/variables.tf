
variable "iam_role_name" {
  description = "The name of the IAM role to attach to EC2"
  type        = string
}

variable "iam_groups" {
  description = "IAM groups allowed to access the EC2 instance"
  type        = list(string)
}
