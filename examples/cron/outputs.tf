output "lambda_function_arn_simple1" {
  description = "The ARN of the Lambda Function"
  value       = module.lambda_simple_cron_1.lambda_function_arn
}
