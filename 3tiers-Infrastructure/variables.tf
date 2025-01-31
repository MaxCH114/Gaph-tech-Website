#################################################
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "instance_tenancy" {
  type    = string
  default = "default"
}
variable "enable_dns_hostnames" {
  type    = bool
  default = true
}
variable "project_name" {}
variable "public_subnet_az1_a" {}
variable "public_subnet_az1_b" {}
variable "public_subnet_az1_c" {}
variable "private_subnet_az1_a" {}
variable "private_subnet_az1_b" {}
variable "private_subnet_az1_c" {}
variable "region" {}



variable "sg_name" {
  type        = string
  description = "Security Group Name"
  default     = "Safety_Group"
}

variable "my_ip" {
  type        = string
  description = "Ip Address that allow to SSH my instances"
}



