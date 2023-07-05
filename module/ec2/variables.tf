variable "security_group_ids" {
  description = "The security group for jump server"
  type        = string
  default     = ""
}
variable "public_subnet_id" {
  description = "The public subnet id"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "The public subnet id"
  type        = string
  default     = "t3.micro"
}
variable "selected_domain" {
  description = "The selected domain"
  type        = string
  default     = ""
}
