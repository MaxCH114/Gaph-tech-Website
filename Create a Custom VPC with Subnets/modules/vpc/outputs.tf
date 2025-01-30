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

output "internet_gateway_id" {
  value = aws_internet_gateway.My_data_center_Cloud_internet_gateway.id
}
