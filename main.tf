# module "Proj_1" {
#   source = "/home/yuval/Desktop/aws_arc/terraform_proj/Terraform-AWS-SNS-EventBridge"
# }
module "Networking" {
  source                    = "./module/networking"
  name                      = "VPC"
  vpc_cidr_block            = "10.0.0.0/16"
  public_subnets_cidr_block = "10.0.0.0/24"
}
module "ec2" {
  source             = "./module/ec2"
  security_group_ids = module.Networking.security_groups_ids
  public_subnet_id   = module.Networking.public_subnets_id
  # selected_domain    = "Enter your domain name --> refer to ./module/ec2 to uncomment"
}
module "EventBridge" {
  source              = "./module/EventBridge"
  time_instance_start = "cron(00 16 * * ? *)"
  time_instance_stop  = "cron(00 04 * * ? *)"
  instance_id         = module.ec2.aws_instance_id
  email_dev           = "yuvalcoren@gmail.com"

}

