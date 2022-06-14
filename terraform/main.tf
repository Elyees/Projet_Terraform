module "aws-s3-static-website-bucket" {
    source = "./modules/aws-s3-static-website-bucket"
    aws_s3_bucket-var = "elyes-devopssec-terraform"
}

resource aws_iam_role lambda {
  name = "LambdaFunctionRole-${var.lambda_function_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

data archive_file lambda {
  type        = "zip"
  output_path = "${path.module}/dist/lambda.zip"
  source_dir  = "${path.module}/lambda/src"
}

variable lambda_function_name {
  type        = string
  default     = "elyes"
  description = "the unzip lambda function"
}

variable s3_event_triggers {
  type        = list(string)
  default     = ["s3:ObjectCreated:*"]
  description = "Which S3 events to trigger the Lambda function from"
}

