variable "name" {
  type        = string
  description = "The VPC name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block of the vpc"
}

variable "public_subnets_cidr_block" {
  type        = string
  description = "CIDR block for Public Subnet"
}

