
variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "allowed_ips" {
  description = "List of IP addresses allowed to SSH"
  type        = list(string)
}
