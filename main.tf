resource "aws_internet_gateway" "prod_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "ProdInternetGateway"
  }
}

resource "aws_route_table" "prod_route_table" {
  vpc_id = var.vpc_id
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.prod_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.prod_igw.id
}

resource "aws_subnet" "subnets" {
  count = length(var.subnet_definitions)

  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_definitions[count.index].cidr_block
  availability_zone = var.subnet_definitions[count.index].availability_zone
  tags = {
    Name = var.subnet_definitions[count.index].name
  }
}

resource "aws_route_table_association" "subnet_associations" {
  count = length(var.subnet_definitions)

  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.prod_route_table.id
}

resource "aws_redshift_subnet_group" "prod_subnet_group" {
  name = "prod-redshift-subnet-group"
  subnet_ids = [for s in aws_subnet.subnets : s.id]
  tags = {
    Name = "ProdRedshiftSubnetGroup"
  }
}