resource "aws_sqs_queue" "queue" {
  name = "sqs-queue-trigger-lambda"
}