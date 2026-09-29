# Infrastructure as Code with Terraform on AWS

## Overview
This project demonstrates how to provision cloud infrastructure with Terraform on Amazon Web Services (AWS). It creates a custom Virtual Private Cloud (VPC), a public subnet, a security group, and an Ubuntu EC2 instance that can host applications.

It also shows how to use Terraform Remote State with Amazon S3 so multiple team members can safely share and manage infrastructure state.

## What This Project Creates
- Custom VPC
- Public subnet
- Security group with inbound rules:
  - Port 22 (SSH) for secure remote access
  - Port 80 (HTTP) for web traffic
  - Port 443 (HTTPS) for secure web traffic
- Outbound (egress) rules allowing all traffic (`-1`) so the instance can access the internet
- EC2 instance running Ubuntu with your AWS key pair
- Remote state stored in S3 for collaborative and secure state management

## Prerequisites
Before running this project, make sure you have:
- An AWS account
- AWS CLI configured with valid credentials
- Terraform installed locally
- An EC2 key pair created in AWS
- An S3 bucket created for Terraform remote state

Important: You must manually create the S3 bucket and ensure its name matches the value defined in `provider.tf`.

## Project Structure
```text
.
├── main.tf
├── provider.tf
├── variables.tf
├── README.md
```

### File Overview
- `main.tf` — Defines the VPC, public subnet, security group, and EC2 instance
- `variables.tf` — Contains input variables such as instance type and key pair name
- `provider.tf` — Configures the AWS provider and Terraform backend using S3
- `README.md` — Project documentation and usage steps

## AWS Configuration Notes
The default AWS region used in this project is:
```hcl
region = "us-east-1"
```

The backend is configured in `provider.tf` as:
```hcl
terraform {
  backend "s3" {
    bucket = "abi-terraform-file"
    key    = "my-assignment/terraform.tfstate"
    region = "us-east-1"
  }
}
```

Make sure the S3 bucket name exactly matches `"abi-terraform-file"` unless you update it in both the AWS bucket and the Terraform backend configuration.

## How to Run
1. Initialize Terraform:
```bash
terraform init
```

2. Review the execution plan:
```bash
terraform plan
```

3. Apply the infrastructure:
```bash
terraform apply --auto-approve
```

## Check Outputs
After deployment, Terraform will display the EC2 instance's public IP and DNS name in the output section.

## Optional Cleanup
To remove the resources created by this project:
```bash
terraform destroy --auto-approve
```

## Notes
- Security group rules allow SSH, HTTP, and HTTPS traffic from anywhere for demonstration purposes.
- The instance uses the default key pair name from `variables.tf`:
```hcl
default = "AWS_login"
```
- If you change the key pair name, make sure the corresponding AWS key pair exists in the selected region.

## Summary
This project is a simple and practical Terraform example for AWS infrastructure provisioning, with a focus on network setup, security, EC2 deployment, and remote backend storage using S3.
