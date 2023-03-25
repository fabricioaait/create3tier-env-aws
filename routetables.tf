# Define the public route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-subnet-rt"
  }
}

# Assign the public route table to the public subnet for AZ A
resource "aws_route_table_association" "public-rt-association-aza" {
  subnet_id      = aws_subnet.public-subnet-aza.id
  route_table_id = aws_route_table.public-rt.id
}

# Assign the public route table to the public subnet for AZ B 
resource "aws_route_table_association" "public-rt-association-azb" {
  subnet_id      = aws_subnet.public-subnet-azb.id
  route_table_id = aws_route_table.public-rt.id
}

# Route table for private subnets connect to nat gateway in public subnet
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgtw.id
  }
  tags = {
    Name = "private_rtb"
  }
}

# Assign the private route table to private subnets in tier 2 & 3 for AZs A & B  
 resource "aws_route_table_association" "private-rt-association-tier2-aza" {
  subnet_id      = aws_subnet.private-subnet-tier2-aza.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-rt-association-tier2-azb" {
  subnet_id      = aws_subnet.private-subnet-tier2-azb.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-rt-association-tier3-aza" {
  subnet_id      = aws_subnet.private-subnet-tier3-aza.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-rt-association-tier3-azb" {
  subnet_id      = aws_subnet.private-subnet-tier3-azb.id
  route_table_id = aws_route_table.private-rt.id
}