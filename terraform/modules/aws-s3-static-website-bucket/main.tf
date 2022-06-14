variable "aws_s3_bucket-var" {
    description = "Name of the s3 bucket. Must be unique."
    type = string
}
resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.aws_s3_bucket-var
    acl    = "public-read"
    policy = <<EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "PublicReadGetObject",
                    "Effect": "Allow",
                    "Principal": "*",
                    "Action": [
                        "s3:GetObject"
                    ],
                    "Resource": [
                        "arn:aws:s3:::${var.aws_s3_bucket-var}/*"
                    ]
                }
            ]
        }
        EOF

     website {
          index_document = "index.html"
          error_document = "error.html"
     }
}

