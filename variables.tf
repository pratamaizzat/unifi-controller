locals {
  tags = {
    Owner      = "Interads"
    Maintainer = "Ilfat Izzat Pratama"
    Group      = "team_infra"
  }
}

variable "instance_type" {
  type        = string
  default     = "t3.medium"
  description = "Instance Type Unifi Controller Server"
}

variable "subnet_id" {
  type        = string
  default     = "subnet-97e0e9f0"
  description = "Subnet for Unifi Controller EC2 Server"
}

variable "sg" {
  description = "List of Security Group Of Unifi Controller Server "
  type        = list(string)
  default     = ["sg-0e5c482d38c86d984"]
}