
# * Cron Example * #
module "lambda_simple" {
  source            = "../../"
  function_name     = "test-cron"
  description       = "This is a test"
  source_path       = "./function/"
  cron              = "cron(0 12 * * ? *)"
  schedule_group    = "test-group-cron"
  schedule_role_arn = aws_iam_role.schedule_role.arn
}

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
          Service = "events.amazonaws.com"
        }
      }
    ]
  })
}
