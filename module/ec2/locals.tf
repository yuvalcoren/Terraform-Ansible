locals {
  private_key_path   = "~/Desktop/aws_arc/terraform_proj/Terraform-Ansible/devkey.pem"
  security_group_ids = var.security_group_ids
  public_subnet_id   = var.public_subnet_id
  key_name           = "devkey"
  instance_type      = var.instance_type
  selected_domain    = var.selected_domain
  availability_zone  = var.availability_zone
}