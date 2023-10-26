# Create a VPC
resource "aws_vpc" "my_project_vpc" {
  cidr_block = #ny IP of your choosing
}

# Create a subnet within the VPC
resource "aws_subnet" "my_project_subnet" {
  vpc_id            = aws_vpc.my_project_vpc.id
  cidr_block        = #any IP of your choosing
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "my_project_subnet_2" {
  vpc_id            = aws_vpc.my_project_vpc.id
  cidr_block        = #any IP of your choosing
  availability_zone = "us-east-1b"
}

# Create an internet gateway
resource "aws_internet_gateway" "my-project-igw" {
  vpc_id = aws_vpc.my_project_vpc.id
  tags = {
    Name : "my_project-ig"
  }
}

# Create a route table
resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = aws_vpc.my_project_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-project-igw.id
  }
  tags = {
    Name : "my-project-main-rtb"
  }
}
