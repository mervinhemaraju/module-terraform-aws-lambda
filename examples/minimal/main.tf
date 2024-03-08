
# * Basic Example * #

module "lambda_simple" {
  source        = "../../"
  function_name = "test-simple"
  description   = "This is a test"
  source_path   = "./function/"
}
