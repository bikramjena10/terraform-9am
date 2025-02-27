# Lambda function definition
resource "aws_lambda_function" "my_lambda_function" {
  function_name = "my_lambda_function"
  role          = "arn:aws:iam::156041437931:role/lambda_rds"
  handler       = "lambda_function.lambda_handler"  # Replace with your handler (e.g., "app.main")
  runtime       = "python3.12"      # Replace with your preferred runtime (nodejs, python, etc.)
  timeout       = 900
  memory_size   = 128
  # Path to the ZIP file containing your Lambda function code
  filename      = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
} 