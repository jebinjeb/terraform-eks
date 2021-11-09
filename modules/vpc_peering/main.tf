resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_vpc_id = var.peer_vpc_id
  vpc_id      = var.vpc_id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "EKS to RDS VPC peering"
  }
}

resource "aws_route_table" "rds_access" {
  vpc_id = var.vpc_id
  route {
    cidr_block                = var.rds_subnet
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.natgw_ids[0]
  }
  tags = {
    Name = "Private Route Table for rds Access"
  }
  depends_on = [aws_vpc_peering_connection.vpc_peering]
}
