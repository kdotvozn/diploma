// aws provider vars
variable "region" {
  description = "AWS region for the S3 and DynamoDB"
  type = string
  default = "eu-north-1"
}

// remote backend vars
variable "state_bucket" {
  default = "tfstate-diploma"
}
variable "dynamodb_table" {
  default = "terraform-state-lock-diploma"
}

variable "AWS_ACCESS_KEY" {
  default = "AKIA2DNACYU4PAQYCROK"
}
variable "AWS_SECRET_KEY" {
  default = "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"
}