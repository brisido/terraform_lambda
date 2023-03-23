variable "lambda_function" {
  description = "Name of lambda"
  type = string
  default = "lambda_function"
}

variable "tags" {
  description = "aws tags"
  type = map
  default = {
    env = "dev"
  }
}