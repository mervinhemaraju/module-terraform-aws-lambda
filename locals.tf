
# * Locals
locals {


  lambda = {
    attach_policies = length(var.policies_arns) != 0

    create_role = var.lambda_role_arn == null

    create_async_event_config = false

    maximum_retry_attempts = 0

    number_of_policies = length(var.policies_arns)

    publish = true

    trusted_entities = [
      {
        type = "Service",
        identifiers = [
          "lambda.amazonaws.com"
        ]
      }
    ]
  }

  schedule_group = {
    name = "schedule-group-for-${var.function_name}"
  }

  scheduler = {
    name                      = "schedule-for-${var.function_name}"
    description               = "The scheduler for lambda function ${var.function_name}"
    state                     = "ENABLED"
    flexible_time_window_mode = "OFF"
    maximum_retry_attempts    = 0
  }
}
