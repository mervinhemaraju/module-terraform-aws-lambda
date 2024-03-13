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

  create_package = var.create_package
  package_type   = local.lambda.package_type
  image_uri      = var.image_uri

  timeout                   = var.timeout
  create_async_event_config = local.lambda.create_async_event_config
  maximum_retry_attempts    = local.lambda.maximum_retry_attempts

  # * Policies attachment
  policies           = var.policies_arns
  attach_policies    = local.lambda.attach_policies
  number_of_policies = local.lambda.number_of_policies

  # * Role Attachment
  lambda_role = var.lambda_role_arn
  create_role = local.lambda.create_role

  # * Publish the function
  publish = local.lambda.publish

  # * Environment variables
  environment_variables = var.environment_variables

  # * Tags
  tags = var.tags

  trusted_entities = local.lambda.trusted_entities
}
