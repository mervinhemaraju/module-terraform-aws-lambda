
variable "function_name" {
  type        = string
  description = "The name of the Lambda Function."
}

variable "description" {
  type        = string
  description = "The description of the Lambda Function."
}

variable "source_path" {
  type        = string
  description = "The path to the source code of the Lambda Function."
  default     = "./"
}

variable "handler" {
  type        = string
  description = "Lambda Function entrypoint in your code."
  default     = "main.main"
}

variable "runtime" {
  type        = string
  description = "The Lambda funtion's runtime"
  default     = "python3.11"
}

variable "layers" {
  type        = list(string)
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function."
  default     = null
}

variable "timeout" {
  type        = string
  description = "The amount of time your Lambda Function has to run in seconds."
  default     = "600"
}

variable "memory_size" {
  type        = string
  description = "Amount of memory in MB your Lambda Function can use at runtime."
  default     = 128
}

variable "cloudwatch_logs_retention_in_days" {
  type        = string
  description = "Specifies the number of days you want to retain log events in the specified log group."
  default     = 14
}

variable "policies_arns" {
  type        = list(string)
  description = "A list of arns of policies you need to attach to the Lambda."
  default     = []
}

variable "lambda_role_arn" {
  type        = string
  description = "The role arn to attach to the Lambda function."
  default     = null
}

variable "environment_variables" {
  type        = map(string)
  description = "Specifies the number of days you want to retain log events in the specified log group."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to resources."
  default     = {}
}

variable "cron" {
  type        = string
  description = "The cron expression to trigger the lambda function."
  default     = null
}

variable "schedule_group" {
  type        = string
  description = "The name of the schedule group."
  default     = null
}

variable "schedule_role_arn" {
  type        = string
  description = "The role arn to attach to the schedule."
  default     = null
}

variable "scheduler_lambda_payload" {
  type        = string
  description = "The payload to send to the lambda function (string format)"
  default     = null
}
