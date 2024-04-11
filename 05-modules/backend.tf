provider "aws" {}


terraform {
  backend "s3" {
    bucket = "b55-terraform-state-ganesh"
    key    = "tfmodules/terraform.tfstate" 
    region = "us-east-1"
  }
}
