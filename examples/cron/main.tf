
# Schedule role
resource "aws_iam_role" "schedule_role" {
  name = "schedule_role_cron"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "scheduler.amazonaws.com"
        }
      }
    ]
  })
}

# Managed scehdule group
resource "aws_scheduler_schedule_group" "cron_test" {
  name = "test-group-1"
}


# * Cron Example with schedule group * #
module "lambda_simple_cron_1" {
  source            = "../../"
  function_name     = "test-cron-1"
  description       = "This is a test"
  source_path       = "./function/"
  cron              = "cron(0 12 * * ? *)"
  schedule_group    = aws_scheduler_schedule_group.cron_test.name
  schedule_role_arn = aws_iam_role.schedule_role.arn
}


# * Cron Example without schedule group * #
module "lambda_simple_cron_2" {
  source            = "../../"
  function_name     = "test-cron-2"
  description       = "This is a test"
  source_path       = "./function/"
  cron              = "cron(0 12 * * ? *)"
  schedule_role_arn = aws_iam_role.schedule_role.arn
}
