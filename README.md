Project Name
DevOps Work Environment with AWS, Terraform, and Ansible

Table of Contents
Introduction
Project Modules
Getting Started
Usage
Contributing
License
Introduction
The purpose of this project is to create a full DevOps work environment by integrating several tools into an EC2 instance on AWS using Terraform and Ansible. The project consists of three different modules, each serving a different purpose.

Project Modules
Networking Module: This module creates essential networking tools such as security groups, VPC, subnet, etc.

EC2 Module: This module creates an EC2 instance and deploys Ansible tool on it. The Ansible playbook is responsible for installing Jenkins and Docker Engine.

EventBridge Module: This module utilizes two different functionalities of AWS EventBridge:

Scheduler using Cron: You can enter your desired time in cron format to schedule instance start and stop events.
Event Rules: Each time an instance is started or stopped, it will send a notification to your desired email.
