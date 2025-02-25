resource "aws_instance" "name" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.nano"
  key_name = "linuxpra"
  availability_zone = "us-east-1a"
    tags = {
      Name = "dev"
    }
}