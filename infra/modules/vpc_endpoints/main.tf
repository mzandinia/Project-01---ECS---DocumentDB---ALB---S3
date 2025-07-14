data "aws_region" "current" {}

# Endpoints module
resource "aws_vpc_endpoint" "this" {

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${data.aws_region.current.name}.${var.endpoint_service_name}"
  vpc_endpoint_type   = var.endpoint_type
  subnet_ids          = var.endpoint_type == "Interface" ? var.private_subnet_ids : null
  route_table_ids     = var.endpoint_type == "Gateway" ? var.private_route_table_ids : null
  security_group_ids  = var.endpoint_type == "Interface" ? var.security_group_ids : null
  private_dns_enabled = var.endpoint_type == "Interface" ? var.private_dns_enabled : null

  tags = {
    Name        = "${var.project_name}-${var.endpoint_service_name}"
    Environment = var.environment
  }
}
