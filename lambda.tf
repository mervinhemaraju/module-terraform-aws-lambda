# * Lambda Function module
module "lambda_function" {

  # * source module info
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 4"

  # * Function basic info
  function_name = var.function_name
  description   = var.description
  handler       = var.handler
  runtime       = var.runtime
  layers        = var.layers

  # * Function advance info
  memory_size                       = var.memory_size
  cloudwatch_logs_retention_in_days = var.cloudwatch_logs_retention_in_days

  # * Source code
  source_path = var.source_path

  timeout                   = var.timeout
  create_async_event_config = false
  maximum_retry_attempts    = 0

  # * Policies attachment
  policies           = var.policies_arns
  attach_policies    = local.attach_policies
  number_of_policies = length(var.policies_arns)

  # * Role Attachment
  lambda_role = var.lambda_role_arn
  create_role = var.lambda_role_arn == null

  # * Publish the function
  publish = true

  # * Environment variables
  environment_variables = var.environment_variables

  # * Tags
  tags = var.tags

  trusted_entities = [
    {
      type = "Service",
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
  ]
}
