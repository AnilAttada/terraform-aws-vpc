resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = merge(
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id    #here only the igw associates with vpc

  tags = merge(
    var.igw_tags,
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}"
    }
  )
}