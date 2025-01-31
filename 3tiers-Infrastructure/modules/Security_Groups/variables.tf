variable vpc_id {
  description = "vpc id for security group"
  type        = string
}


variable "my_ip" {
  type        = string
  description = "Ip Address that allow to SSH my instances"
  default     = "0.0.0.0/0"
}

variable "sg_name" {
  type        = string
  description = "Security Group Name"
  default     = "Safety_Group"
}

