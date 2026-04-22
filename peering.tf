resource "aws_vpc_peering_connection" "roboshop-default" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = data.aws_vpc.selected.id   #acceptor vpc id i.e default vpc here
  vpc_id        = aws_vpc.main.id  #requestor vpc id i.e roboshop(created) one
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = merge(
    var.vpc_peering_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-default"
    }
  )
}

resource "aws_route" "public-peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.selected.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.roboshop-default[count.index].id
}

resource "aws_route" "private-peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.selected.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.roboshop-default[count.index].id
}

resource "aws_route" "database-peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.selected.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.roboshop-default[count.index].id
}

resource "aws_route" "default-peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id = data.aws_route_table.main.id
  destination_cidr_block = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.roboshop-default[count.index].id
}