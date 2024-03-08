
resource "aws_scheduler_schedule_group" "lambda_trigger" {
  count = var.cron != null && var.schedule_group == null ? 1 : 0
  name  = local.schedule_group.name
}

resource "aws_scheduler_schedule" "lambda_scheduler" {

  count = var.cron != null ? 1 : 0

  name                = local.scheduler.name
  description         = local.scheduler.description
  group_name          = var.schedule_group != null ? var.schedule_group : aws_scheduler_schedule_group.lambda_trigger[0].name
  schedule_expression = var.cron
  state               = local.scheduler.state

  flexible_time_window {
    mode = local.scheduler.flexible_time_window_mode
  }

  target {
    arn      = module.lambda_function.lambda_function_arn
    role_arn = var.schedule_role_arn

    retry_policy {
      maximum_retry_attempts = local.scheduler.maximum_retry_attempts
    }

    input = var.scheduler_lambda_payload
  }
}
