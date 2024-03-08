
resource "aws_scheduler_schedule_group" "lambda_trigger" {
  count = var.cron != null && var.schedule_group == null ? 1 : 0
  name  = "schedule-group-for-${var.function_name}"
}

resource "aws_scheduler_schedule" "lambda_scheduler" {

  count = var.cron != null ? 1 : 0

  name                = "schedule-for-${var.function_name}"
  description         = "The scheduler for lambda function ${var.function_name}"
  group_name          = var.schedule_group != null ? var.schedule_group : aws_scheduler_schedule_group.lambda_trigger.name
  schedule_expression = var.cron
  state               = "ENABLED"

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = module.lambda_function.lambda_function_arn
    role_arn = var.schedule_role_arn

    retry_policy {
      maximum_retry_attempts = 0
    }

    input = var.scheduler_lambda_payload
  }
}
