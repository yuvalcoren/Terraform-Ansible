
resource "aws_scheduler_schedule" "stop_instance_in_time" {
  name = "my-schedule-stop"

  flexible_time_window {
    mode = "OFF"
  }
  schedule_expression = local.time_instance_stop

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:stopInstances"
    role_arn = aws_iam_role.startinschedule.arn

    input = jsonencode(
      { "InstanceIds" : [local.instance_id] }
    )
  }
}
resource "aws_scheduler_schedule" "start_instance_in_time" {
  name = "my-schedule-start"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = local.time_instance_start

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:startInstances"
    role_arn = aws_iam_role.startinschedule.arn

    input = jsonencode(
      { "InstanceIds" : [local.instance_id] }
    )
  }
}
resource "aws_cloudwatch_event_rule" "state_ec2_rule" {
  name        = "capture-ec2-state-change"
  description = "Capture each AWS ec2 state-change"

  event_pattern = jsonencode({
    "source" : ["aws.ec2"],
    "detail-type" : ["EC2 Instance State-change Notification"],
    "detail" : {
      "state" : ["stopped", "running"]
    }
  })
}

resource "aws_cloudwatch_event_target" "target_sns" {
  rule      = aws_cloudwatch_event_rule.state_ec2_rule.name
  target_id = "SendToSNS"
  arn       = local.topic_state_arn
}

resource "aws_sns_topic" "aws_ec2_state" {
  name = "aws-ec2-state"
}


resource "aws_sns_topic_subscription" "user_updates_sms_target" {
  topic_arn = local.topic_state_arn
  protocol  = "email"
  endpoint  = local.email_dev
}
resource "aws_sns_topic_policy" "sns_state_policy" {
  arn    = local.topic_state_arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [local.topic_state_arn]
  }
}
resource "aws_iam_role_policy" "StartStopEc2Instances" {
  name        = "StartStopPolicyInstances"
  role        = aws_iam_role.startinschedule.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "StartStopEc2",
        "Effect" : "Allow",
        "Action" : [
          "ec2:StopInstances",
          "ec2:StartInstances"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role" "startinschedule" {
  name = "scheduleRole"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "scheduler.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    tag-key = "start-schedule"
  }
}