locals {
  private_key_path   = "./devkey.pem"
  security_group_ids = var.security_group_ids
  public_subnet_id   = var.public_subnet_id
  key_name           = aws_key_pair.kp.key_name
  instance_type      = var.instance_type
  selected_domain    = var.selected_domain
}