resource "aws_lambda_function" "lambda" {
  filename      = "lambda_function.zip"
  function_name = var.lambda_function
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.9"

  environment {
    variables = {
      foo = "bar"
    }
  }

  tags = var.tags
}