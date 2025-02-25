terraform {
  backend "s3" {
    bucket = "chandanref"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
