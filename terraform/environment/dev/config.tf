provider "aws" {
  region = "${var.region}"
  profile = "default"
}

// Main configuration
variable "region"               {default = "us-east-1"}
variable "jar_file"             {default = "aws-step-functions-1.0-SNAPSHOT.jar"}
variable "environment_prefix"   {default = "dev"}

// AWS pre-existing resources
variable "lambda_role_arn"      {default = "arn:aws:iam::173725689523:role/lambda-rol"}

module "core" {
  source                    = "../../module/core"
  region                    = "${var.region}"
  jar_file                  = "${var.jar_file}"
  sns_topic                 = ""
  environment_prefix        = "${var.environment_prefix}"
  lambda_role_arn           = "${var.lambda_role_arn}"
}