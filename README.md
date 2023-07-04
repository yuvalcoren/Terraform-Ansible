# The purpose of the project is to create a full Devops work environment with several tools
# already integrated into an EC2 instance on AWS using Terraform AND Ansible.
# in detail, this project combined with 3 different modules, each describes different purpose
# Networking module creates essential networking tools as security groups, VPC, Subnet etc..
# ec2 module which creates ec2 instance AND deploys Ansible tool to install jenkins and docker engine using playbook
# EventBridge which uses two of its different functionalities:
# Scheduler using cron: enter you desired time time in cron format to which you instance will stop and start.
# Event rules: Each time an instance is stopped or start, it will notify to your desired mail.
