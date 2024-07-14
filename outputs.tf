output "subnet_ids" {
  value = [for s in aws_subnet.subnets : s.id]
}

output "route_table_id" {
  value = aws_route_table.prod_route_table.id
}

output "subnet_group_name" {
  value = aws_redshift_subnet_group.prod_subnet_group.name
}
