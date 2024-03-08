
# * Locals
locals {
  attach_policies = length(var.policies_arns) != 0
}
