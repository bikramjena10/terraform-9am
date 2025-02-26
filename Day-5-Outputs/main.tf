resource "aws_instance" "Dev" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name = "linuxpra"
  availability_zone = "ap-south-1b"
  tags = {
    Name ="Dev5"
  }
}

 terraform {
backend "s3" {
    bucket         = "chandanref"  # Name of the S3 bucket where the state will be stored.
    region         =  "ap-south-1"
    key            = "day-5/terraform.tfstate" # Path within the bucket where the state will be read/written.
    dynamodb_table = "terraform-state-lock-dynamo" # DynamoDB table used for state locking, note: first run day-4-s3-dynamodb resource then day-4-state-remote-backend
    encrypt        = true  # Ensures the state is encrypted at rest in S3.
}
}