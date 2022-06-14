resource aws_lambda_function lambda {
  filename         = data.archive_file.lambda.output_path
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda.arn
   handler          = "hello.js"
   runtime          = "nodejs12.x"
}

resource aws_lambda_permission allow_bucket {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "s3.amazonaws.com" 
}