# SQS Trigger
resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  batch_size       = 10
  event_source_arn = aws_sqs_queue.queue.arn
  enabled          = true 
  function_name    = aws_lambda_function.lambda.function_name
}

# Cloudwatch Event Trigger
resource "aws_cloudwatch_event_rule" "rule" {
  name                = "lambda-trigger"
  schedule_expression = "cron(0 9 * * ? *)"
  is_enabled          = true
}

resource "aws_cloudwatch_event_target" "target" {
  rule      = aws_cloudwatch_event_rule.rule.name
  target_id = "lambda"
  arn       = aws_lambda_function.lambda.arn
}

# Lambda Permission
resource "aws_lambda_permission" "permission" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.rule.arn
}