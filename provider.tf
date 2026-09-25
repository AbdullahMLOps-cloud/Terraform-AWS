provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "abi-terraform-file"
    key    = "my-assignment/terraform.tfstate"
    region = "us-east-1"
  }
}
