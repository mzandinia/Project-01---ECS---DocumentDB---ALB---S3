output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = length(var.public_subnet_cidrs) > 0 ? aws_subnet.public[*].id : []
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = length(var.public_subnet_cidrs) > 0 ? aws_internet_gateway.igw[0].id : null
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = length(var.public_subnet_cidrs) > 0 ? aws_route_table.public[0].id : null
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = length(var.private_subnet_cidrs) > 0 ? aws_subnet.private[*].id : []

}

output "private_route_table_id" {
  description = "ID of the private route table"
  value       = length(var.private_subnet_cidrs) > 0 ? aws_route_table.private[0].id : null
}