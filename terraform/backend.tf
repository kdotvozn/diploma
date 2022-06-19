
terraform {
  backend "s3" {
    bucket = "tfstate-diploma"
    key = "terraform.tfstate"
    dynamodb_table = "terraform-state-lock-diploma"
    region = "eu-north-1"
    encrypt = true
  }
  required_providers {
    aws = {
      version = ">=3.59.0"
    }
  }
}
