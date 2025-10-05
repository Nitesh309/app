terraform {
  backend "s3" {
    bucket  = "tf-state-file-management-dim"
    key     = "project1/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
    # dynamodb_table = "my-terraform-lock-table"
  }
}
