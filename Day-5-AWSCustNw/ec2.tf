# Create EC2 Instance
resource "aws_instance" "prod" {
  ami             = "ami-0d682f26195e9ec0f"  # Replace with a valid AMI ID
  instance_type   = "t2.micro"
  key_name        = "linuxpra"  # Ensure this key exists
  subnet_id = aws_subnet.prod.id
  vpc_security_group_ids = [aws_security_group.prod.id]

  tags = {
    Name = "prod_ec5"
  }
}