#creating s3 bucket and dynamo DB for state backend storgae and applying the lock mechanisam for statefile

# This backend configuration instructs Terraform to store its state in an S3 bucket.
 terraform {
backend "s3" {
    bucket         = "chandanreftest"  # Name of the S3 bucket where the state will be stored.
    region         =  "ap-south-1"
    key            = "terraform.tfstate" # Path within the bucket where the state will be read/written.
    dynamodb_table = "terraform-state-lock-dynamo-db_test" # DynamoDB table used for state locking, note: first run day-4-s3-dynamodb resource then day-4-state-remote-backend
    encrypt        = true  # Ensures the state is encrypted at rest in S3.
}
}

#change the dynamo db name and do not delete s3 bucket and you can block creation of bucket in mail.tf file
# it worked 