module lambda {
  source = "git@github.com:softrams-iac/terraform-aws-lambda.git?ref=1.0.0"

  function_name  = "${{values.name}}"
  description    = "${{values.description}}"
  handler        = "${{values.handler}}"
  runtime        = "${{values.runtime}}"
  memory_size    = "${{values.memory_size }}"
  concurrency    = "${{values.concurrency}}"
  lambda_timeout = "${{values.lambda_timeout}}"
  log_retention  = "${{values.log_retention}}"
  role_arn       = "${{values.role_arn}}"

  vpc_config = {
    subnet_ids         = "${{values.subnet_ids}}"
    security_group_ids = "${{values.security_group_ids}}"
  }
}
