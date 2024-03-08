
# * Basic Example * #

module "lambda_simple" {
  source        = "../../"
  function_name = "test"
  description   = "This is a test"
  source_path   = "./function/"
}
