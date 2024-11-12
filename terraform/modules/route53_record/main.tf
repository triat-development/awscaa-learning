variable "hosted_zone_name" {
  description = "The Route 53 hosted zone name"
  type        = string
}

variable "record_name" {
  description = "The name for the DNS record"
  type        = string
}

variable "record_target" {
  description = "The target value for the DNS record"
  type        = string
}

data "aws_route53_zone" "selected" {
  name         = var.hosted_zone_name
  private_zone = false
}

resource "aws_route53_record" "dns_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.record_name
  type    = "CNAME"
  ttl     = 300
  records = [var.record_target]
}

output "dns_record_fqdn" {
  description = "The fully qualified domain name of the Route 53 DNS record"
  value       = aws_route53_record.dns_record.fqdn
}
