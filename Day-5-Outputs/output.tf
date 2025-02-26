output "az" {
  value = aws_instance.Dev.availability_zone
}

output "public_ip" {
  value = aws_instance.Dev.public_ip
}

output "privateIp" {
  value = aws_instance.Dev.private_ip
  sensitive = true
}