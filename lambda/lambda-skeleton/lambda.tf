module lambda {
  source = "git@github.com:softrams-iac/terraform-aws-lambda.git?ref=1.0.0"

  function_name  = ${{values.name}}
  description    = "description should be here"
  handler        = "index.handler"
  runtime        = "nodejs12.x"
  memory_size    = "128"
  concurrency    = "5"
  lambda_timeout = "20"
  log_retention  = "1"
  role_arn       = var.iam_role_arn

  vpc_config = {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
}
