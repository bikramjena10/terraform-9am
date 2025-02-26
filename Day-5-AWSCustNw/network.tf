# Create a VPC
resource "aws_vpc" "Prod" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "prod_vpc"
  }
}

# Create Subnet
resource "aws_subnet" "prod" {
  vpc_id                  = aws_vpc.Prod.id
  cidr_block              = "10.0.0.0/24"
 # availability_zone       = "ap-south-1b"  # Modify as needed for your region
 # map_public_ip_on_launch = true

  tags = {
    Name = "prod_subnet"
  }
}

resource "aws_subnet" "prod_Private" {
  vpc_id                  = aws_vpc.Prod.id
  cidr_block              = "10.0.1.0/24"
 # availability_zone       = "ap-south-1b"  # Modify as needed for your region
 # map_public_ip_on_launch = true

  tags = {
    Name = "prod_Peivate_subnet"
  }
}


# Create Internet Gateway
resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.Prod.id

  tags = {
    Name = "prod_ig"
  }
}

# Create Route Table
resource "aws_route_table" "prod_route_table" {
  vpc_id = aws_vpc.Prod.id

  # Define the route
  route {
    gateway_id = aws_internet_gateway.prod.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "prod_route_table"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "prod_association" {
  route_table_id = aws_route_table.prod_route_table.id
  subnet_id      = aws_subnet.prod.id
}

#create nat gateway for private subnet
#create  route for private subnets and edit routs
#route table association 

# Create a Security Group
resource "aws_security_group" "prod" {
  name        = "allow_tls"
  description = "Allow inbound SSH and HTTP traffic"
  vpc_id      = aws_vpc.Prod.id

  # Inbound rules
  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "prod_security_group"
  }
}


