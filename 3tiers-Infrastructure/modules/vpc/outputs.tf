# Purpose: Define the output variables for the VPC module.
# The output variables are used to expose the resources created by the VPC module to other modules.
output "vpc_id" {
  value = aws_vpc.My_data_center_Cloud.id
}

output "public_subnet_az1_a_id" {
  value = aws_subnet.public_subnet_az1_a.id
}

output "public_subnet_az1_b_id" {
  value = aws_subnet.public_subnet_az1_b.id
}

output "public_subnet_az1_c_id" {
  value = aws_subnet.public_subnet_az1_c.id
}

output "private_subnet_az1_a_id" {
  value = aws_subnet.private_subnet_az1_a.id
}

output "private_subnet_az1_b_id" {
  value = aws_subnet.private_subnet_az1_b.id
}

output "private_subnet_az1_c_id" {
  value = aws_subnet.private_subnet_az1_c.id
}

output "db_subnet_az1_a_id" {
  value = aws_subnet.db_subnet_az1_a.id
}

output "route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "private_route_table_id" {
  value = aws_route_table.private_route_table.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.My_data_center_Cloud_internet_gateway.id
}

output "project_name" {
  value = var.project_name
}
