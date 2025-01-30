# Purpose: Define the input variables for the VPC module
# The input variables are used to pass values into the VPC module from the root module.
variable "project_name"         {}
variable "instance_tenancy"     {}
variable "enable_dns_hostnames" {}
variable "public_subnet_az1_a"  {}
variable "public_subnet_az1_b"  {}
variable "public_subnet_az1_c"  {}
variable "private_subnet_az1_a" {}
variable "private_subnet_az1_b" {}
variable "private_subnet_az1_c" {}
variable "region"               {}
variable "vpc_cidr"             {}
