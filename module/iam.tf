resource "aws_iam_user" "nexus_s3_user" {
  name          = module.nexus_label.name
  path          = "/"
  force_destroy = "false"
}


resource "aws_iam_user_policy_attachment" "nexus_s3_allow_policy" {
  user       = aws_iam_user.nexus_s3_user.name
  policy_arn = aws_iam_policy.nexus_s3_policy.arn
}

resource "aws_iam_access_key" "nexus_s3_access_key" {
  user  = aws_iam_user.nexus_s3_user.name
}

resource "aws_iam_policy" "nexus_s3_policy" {
  name = format("%s-nexus-s3-policy",module.nexus_label.name)
  path = "/"
  description = format("%s-nexus-s3-policy",module.nexus_label.name)
  policy =  <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
    }
  ]
}
EOF
}