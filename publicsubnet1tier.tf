# Define the public subnet for AZ A
resource "aws_subnet" "public-subnet-aza" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.public_subnet_cidr_aza
  availability_zone = local.aze1
  tags = {
    Name = "public-subnet"
  }
}

# Define the public subnet for AZ B
resource "aws_subnet" "public-subnet-azb" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.public_subnet_cidr_azb
  availability_zone = local.aze2
  tags = {
    Name = "public-subnet"
  }
}
