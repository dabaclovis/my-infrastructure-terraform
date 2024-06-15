resource "aws_vpc" "practicebVpc" {
  cidr_block           = lookup(local.name-of-resources[0], "vpc")
  enable_dns_hostnames = lookup(local.name-of-resources[0], "host")
  enable_dns_support   = lookup(local.name-of-resources[0], "dns")
  tags = {
    Name = lookup(local.name-of-resources[0], "name")
  }
}

# public subnets
resource "aws_subnet" "practice-bic-subnet" {
  vpc_id                  = aws_vpc.practicebVpc.id
  map_public_ip_on_launch = lookup(local.name-of-resources[1], "enable")
  availability_zone       = lookup(local.name-of-resources[1], "azone")
  cidr_block              = lookup(local.name-of-resources[1], "public")
  tags = {
    Name = lookup(local.name-of-resources[1], "name")
  }
}


# internet gateway
resource "aws_internet_gateway" "practiceb-internet-gateway" {
  vpc_id = aws_vpc.practicebVpc.id
  tags = {
    Name = lookup(local.name-of-resources[3], "intern")
  }
}

# route table 
resource "aws_route_table" "practiceb-route-table" {
 vpc_id = aws_vpc.practicebVpc.id 
 route {
    gateway_id =  aws_internet_gateway.practiceb-internet-gateway.id 
    cidr_block = "0.0.0.0/0"
 }
 tags = {
   Name = lookup(local.name-of-resources[4],"route")
 }
}
resource "aws_route_table_association" "practiceb-route-table-assc" {
  subnet_id = aws_subnet.practice-bic-subnet.id 
  route_table_id = aws_route_table.practiceb-route-table.id 
}