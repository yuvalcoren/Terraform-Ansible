variable "security_group_ids" {
  description = "The security group for jump server"
  type        = string
  default = ""
}
variable "public_subnet_id" {
  description = "The public subnet id"
  type        = string
    default = ""
}