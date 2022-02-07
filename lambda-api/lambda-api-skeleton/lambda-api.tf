module "lambda" {
  source          = "git@github.com:softrams-iac/terraform-aws-lambda.git?ref=v2.2.1"
  function_name  = "${{values.function_name}}"
  description    = "${{values.description}}"
  handler        = "${{values.handler}}"
  runtime        = "${{values.runtime}}"
  memory_size    = "${{values.memory_size }}tvalues.lambda_timeout}}"
  log_retention  = "${{values.log_retention}}"
  role_arn       = "${{values.role_arn}}"
  s3_key         = "${{values.s3_key}}"
  s3_bucket      = "${{values.s3_bucket}}"
  vpc_config = {
    subnet_ids         = "${{values.subnet_ids}}"
    security_group_ids = "${{values.security_group_ids}}"
  }
}

module "api" {
  source                  = "git@github.com:softrams-iac/terraform-aws-api.git//?ref=1.0.3"
  name                    = "${{values.name}}-${module.lambda.function_name}"
  api_execution_arn       = ${{values.api_execution_arn}} == null ? module.api-gateway.api_execution_arn : ${{values.api_execution_arn}}
  function_name           = module.lambda.function_name
  path_name               = "${{values.path_name}}"
  rest_api_id             = ${{values.rest_api_id }} == null ? module.api-gateway.rest_api_id : var.rest_api_id
  api_name                = module.lambda.function_name
  metrics                 = "${{values.metrics}}"
  log_level               = "${{values.log_level}}"
  lambda_invoke_arn       = module.lambda.lambda_invoke_arn
  api_domain_name         = "${{values.domain}}"
  api_gateway_domain_name = module.api-gateway.domain_name
  domain                  = "${{values.domain}}"
}