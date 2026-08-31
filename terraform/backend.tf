terraform {
  backend "s3" {
    bucket         = "8byte-assessment-tfstate"
    key            = "env/test/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "8byte-assessment-tf-locks"
    encrypt        = true
  }
}
