
# * Basic Example * #

module "lambda_simple" {
  source         = "../../"
  function_name  = "test-cron"
  description    = "This is a test"
  source_path    = "./function/"
  cron           = "cron(0 12 * * ? *)"
  schedule_group = "test-group-cron"
}
