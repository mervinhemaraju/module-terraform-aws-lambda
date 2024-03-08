# > Lambda Function
output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = try(module.lambda-function.lambda_function_arn, "")
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = try(module.lambda-function.lambda_function_name, "")
}

# > IAM Role
output "lambda_role_arn" {
  description = "The ARN of the IAM role created for the Lambda Function"
  value       = try(module.lambda-function.lambda_role_arn, "")
}

output "lambda_role_name" {
  description = "The name of the IAM role created for the Lambda Function"
  value       = try(module.lambda-function.lambda_role_name, "")
}
