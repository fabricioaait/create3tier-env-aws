# Define the private subnet for 3 tier in AZ A
resource "aws_subnet" "private-subnet-tier3-aza" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.private_subnet_cidr_tier3aza
  availability_zone = local.aze1
  tags = {
    Name = "private-subnet-tier3-aza"
  }
}

# Define the private subnet for 3 tier in AZ B
resource "aws_subnet" "private-subnet-tier3-azb" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.private_subnet_cidr_tier3azb
  availability_zone = local.aze2
  tags = {
    Name = "private-subnet-tier3-azb"
  }
}