resource "aws_lambda_function" "lambda-validate" {
  function_name    = "${var.environment_prefix}-lambda-validate"
  role             = "${var.lambda_role_arn}"
  runtime          = "java17"
  handler          = "com.estebanbula.lambda.ValidateLambda::handleRequest"
  filename         = "../../../build/libs/${var.jar_file}"
  source_code_hash = "${base64sha256(filesha256("../../../build/libs/${var.jar_file}"))}"
  memory_size      = 512
  timeout          = 300
  environment {
    variables = {
      sns_topic = "${var.sns_topic}",
    }
  }
}

resource "aws_lambda_function" "lambda-process" {
  function_name    = "${var.environment_prefix}-lambda-process"
  role             = "${var.lambda_role_arn}"
  runtime          = "java17"
  handler          = "com.estebanbula.lambda.ProcessLambda::handleRequest"
  filename         = "../../../build/libs/${var.jar_file}"
  source_code_hash = "${base64sha256(filesha256("../../../build/libs/${var.jar_file}"))}"
  memory_size      = 512
  timeout          = 300
  environment {
    variables = {
      sns_topic = "${var.sns_topic}",
    }
  }
}

resource "aws_lambda_function" "lambda-exception" {
  function_name    = "${var.environment_prefix}-lambda-exception"
  role             = "${var.lambda_role_arn}"
  runtime          = "java17"
  handler          = "com.estebanbula.lambda.ExceptionLambda::handleRequest"
  filename         = "../../../build/libs/${var.jar_file}"
  source_code_hash = "${base64sha256(filesha256("../../../build/libs/${var.jar_file}"))}"
  memory_size      = 512
  timeout          = 300
  environment {
    variables = {
      sns_topic = "${var.sns_topic}",
    }
  }
}