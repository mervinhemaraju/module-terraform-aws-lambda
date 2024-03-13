<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | terraform-aws-modules/lambda/aws | ~> 4 |

## Resources

| Name | Type |
|------|------|
| [aws_scheduler_schedule.lambda_scheduler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/scheduler_schedule) | resource |
| [aws_scheduler_schedule_group.lambda_trigger](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/scheduler_schedule_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_logs_retention_in_days"></a> [cloudwatch\_logs\_retention\_in\_days](#input\_cloudwatch\_logs\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. | `string` | `14` | no |
| <a name="input_create_package"></a> [create\_package](#input\_create\_package) | Whether to create a package for the lambda function. | `bool` | `true` | no |
| <a name="input_cron"></a> [cron](#input\_cron) | The cron expression to trigger the lambda function. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the Lambda Function. | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Specifies the number of days you want to retain log events in the specified log group. | `map(string)` | `{}` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | The name of the Lambda Function. | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | Lambda Function entrypoint in your code. | `string` | `"main.main"` | no |
| <a name="input_image_uri"></a> [image\_uri](#input\_image\_uri) | The URI of a container image in the Amazon ECR registry. | `string` | `null` | no |
| <a name="input_lambda_role_arn"></a> [lambda\_role\_arn](#input\_lambda\_role\_arn) | The role arn to attach to the Lambda function. | `string` | `null` | no |
| <a name="input_layers"></a> [layers](#input\_layers) | List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function. | `list(string)` | `null` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Amount of memory in MB your Lambda Function can use at runtime. | `string` | `128` | no |
| <a name="input_policies_arns"></a> [policies\_arns](#input\_policies\_arns) | A list of arns of policies you need to attach to the Lambda. | `list(string)` | `[]` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The Lambda funtion's runtime | `string` | `"python3.11"` | no |
| <a name="input_schedule_group"></a> [schedule\_group](#input\_schedule\_group) | The name of the schedule group. | `string` | `null` | no |
| <a name="input_schedule_role_arn"></a> [schedule\_role\_arn](#input\_schedule\_role\_arn) | The role arn to attach to the schedule. | `string` | `null` | no |
| <a name="input_scheduler_lambda_payload"></a> [scheduler\_lambda\_payload](#input\_scheduler\_lambda\_payload) | The payload to send to the lambda function (string format) | `string` | `null` | no |
| <a name="input_source_path"></a> [source\_path](#input\_source\_path) | The path to the source code of the Lambda Function. | `string` | `"./function/"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to resources. | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The amount of time your Lambda Function has to run in seconds. | `string` | `"600"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | The ARN of the Lambda Function |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | The name of the Lambda Function |
| <a name="output_lambda_role_arn"></a> [lambda\_role\_arn](#output\_lambda\_role\_arn) | The ARN of the IAM role created for the Lambda Function |
| <a name="output_lambda_role_name"></a> [lambda\_role\_name](#output\_lambda\_role\_name) | The name of the IAM role created for the Lambda Function |
| <a name="output_scheduler_arn"></a> [scheduler\_arn](#output\_scheduler\_arn) | > Scheduler |
<!-- END_TF_DOCS -->