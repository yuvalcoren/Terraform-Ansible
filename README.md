# Project Name

DevOps Work Environment with AWS, Terraform, and Ansible

## Table of Contents

- [Introduction](#introduction)
- [Project Modules](#project-modules)
- [Getting Started](#getting-started)
- [Usage](#usage)

## Introduction

The purpose of this project is to create a full DevOps work environment by integrating several tools into an EC2 instance on AWS using Terraform and Ansible. The project consists of three different modules, each serving a different purpose.

## Project Modules

1. **Networking Module**: This module creates essential networking tools such as security groups, VPC, subnet, etc.

2. **EC2 Module**: This module creates an EC2 instance and deploys Ansible tool on it. The Ansible playbook is responsible for installing Jenkins and Docker Engine.

3. **EventBridge Module**: This module utilizes two different functionalities of AWS EventBridge:
   - **Scheduler using Cron**: You can enter your desired time in cron format to schedule instance start and stop events.
   - **Event Rules**: Each time an instance is started or stopped, it will send a notification to your desired email.

## Getting Started

To get started with this project, follow the steps below:

1. Clone the repository:

   ```bash
   git clone https://github.com/yuvalcoren/Terraform-Ansible.git
   ```

2. Configure AWS credentials:

   Make sure you have valid AWS credentials set up on your local machine. You can do this by either setting the environment variables or configuring the AWS CLI. Refer to the AWS documentation for more information.

3. Install Terraform:

   Make sure you have Terraform installed on your local machine. You can download it from the official Terraform website: [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)

4. Install Ansible:

   Make sure you have Ansible installed on your local machine. You can find installation instructions in the Ansible documentation: [https://docs.ansible.com/ansible/latest/installation_guide/index.html](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

## Usage

To use this project, follow the steps below:

1. Navigate to the root directory of the project:

   ```bash
   cd project-directory
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Apply the Terraform configuration:

   ```bash
   terraform apply
   ```

4. Enter the required input variables when prompted.

5. Wait for the Terraform deployment to complete.

6. Access the EC2 instance using the provided details (IP address, SSH key, etc.).

7. Explore the deployed tools and services (Jenkins, Docker Engine) on the EC2 instance.

8. Customize the EventBridge module as per your requirements by modifying the cron schedule and email notification settings.

