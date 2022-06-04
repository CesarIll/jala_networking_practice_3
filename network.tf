# VPC
resource "aws_vpc" "cia_vpc" {
  cidr_block       = "192.168.0.0/20"
  instance_tenancy = "default"
  tags = {
    Name = "CIA VPC"
  }
}

# Subnet for office 2 (500 hosts)
resource "aws_subnet" "office_2" {
  vpc_id     = aws_vpc.cia_vpc.id
  cidr_block = "192.168.0.0/23"
  tags = {
    Name = "CIA Office 2"
  }
}

# Subnet for office 1 (80 hosts)
resource "aws_subnet" "office_1" {
  vpc_id     = aws_vpc.cia_vpc.id
  cidr_block = "192.168.2.0/25"
  tags = {
    Name = "CIA Office 1"
  }
}

# Subnet for office 3 (40 hosts)
resource "aws_subnet" "office_3" {
  vpc_id     = aws_vpc.cia_vpc.id
  cidr_block = "192.168.2.128/26"
  tags = {
    Name = "CIA Office 3"
  }
}

# Subnet for remote office (30 hosts)
resource "aws_subnet" "remote_office" {
  vpc_id     = aws_vpc.cia_vpc.id
  cidr_block = "192.168.2.192/26"
  tags = {
    Name = "CIA Remote Office"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cia_vpc.id
  tags = {
    Name = "CIA Internet Gateway"
  }
}

# Route table for internet gateway 
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.cia_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "CIA Route Table"
  }
}

# Association between remote office and internet gateway through route table
resource "aws_route_table_association" "association_igw_remote_office" {
  subnet_id      = aws_subnet.remote_office.id
  route_table_id = aws_route_table.rt.id
}
