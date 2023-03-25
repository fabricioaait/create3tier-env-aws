# Define the internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
    Name = "taga-igw"
  }
}

# Define the elastic IP for the NAT gateway 
resource "aws_eip" "ip" {
  vpc      = true
  tags = {
    Name = "natgtweip"
  }
}

# Creates the nat gateway
resource "aws_nat_gateway" "natgtw" {
  allocation_id = aws_eip.ip.id
  subnet_id     = aws_subnet.public-subnet-aza.id
  tags = {
    Name = "nat-gateway"
  }
}







