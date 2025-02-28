#!/bin/bash
resources=(
  "aws_s3_bucket.dependent"
#   "aws_instance.dependent"
)

for resource in "${resources[@]}"; do
  targets+=" -target=$resource"
done

terraform destroy $targets -auto-approve

# example below for multiple targets
#terraform apply -target=aws_s3_bucket.depedent -target=aws_s3_bucket.dev.....etc