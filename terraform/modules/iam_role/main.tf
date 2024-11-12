
resource "aws_iam_role" "my_ec2_instance_role" {
  name = var.iam_role_name

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
  }
  EOF
}

resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "${var.iam_role_name}_profile"
  role = aws_iam_role.my_ec2_instance_role.name
}

resource "aws_iam_role_policy" "ec2_access_policy" {
  name   = "EC2AccessPolicy"
  role   = aws_iam_role.my_ec2_instance_role.name

  policy = data.aws_iam_policy_document.instance_access_policy.json
}

data "aws_iam_policy_document" "instance_access_policy" {
  statement {
    actions   = ["ec2:DescribeInstances", "ec2:GetConsoleOutput"]
    resources = ["*"]
    effect    = "Allow"

#    principals {
#      type        = "AWS"
#      identifiers = [
#        for group in var.iam_groups : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:group/${group}"
#      ]
#    }
  }
}

# Add the missing aws_caller_identity
data "aws_caller_identity" "current" {}

# Add output for the IAM instance profile
output "iam_instance_profile_name" {
  description = "The IAM instance profile name"
  value       = aws_iam_instance_profile.my_instance_profile.name
}
