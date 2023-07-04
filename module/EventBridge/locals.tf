locals {
  topic_state_arn     = aws_sns_topic.aws_ec2_state.arn
  time_instance_stop  = var.time_instance_stop
  time_instance_start = var.time_instance_start
  email_dev           = var.email_dev
  instance_id         = var.instance_id
}