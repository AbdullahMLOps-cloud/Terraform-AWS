# Infrastructure as Code with Terraform (AWS)

# Overview
This project demonstrates how to provision cloud infrastructure using **Terraform**.  
It creates a custom "VPC", Subnet, Security Group, and an "EC2 instance" to host applications.


The project also shows how to use "Remote State" in S3 for team collaboration.


NOTE : You need to explicitly Create a "S3" bucket and make sure it has same name as you define in "Provider.tf" file 

---

##  Features
- Custom **VPC** and **public subnet**
- **Security group** with inbound rules:
  - Port 22 (SSH) → secure login
  - Port 80 (HTTP) → web traffic
  - Port 443 (HTTPS) → secure web traffic
- **Outbound (egress) rules** allow all protocols (`-1`) so the server can reach the internet
- **EC2 instance** (Ubuntu) with your AWS key pair
- **Remote state** stored in S3 for safe, shared state management

---

##  Project Structure

terraform/
│── main.tf         # Resources (VPC, subnet, SG, EC2)
│── variables.tf    # Input variables with defaults
│── outputs.tf      # Useful outputs (public IP/DNS)
│── provider.tf     # AWS provider + backend config

##  How to Run

Initialize Terraform
  
   terraform init
   terraform plan
   terraform apply --auto-approve

## Check outputs

Public IP and DNS of your EC2 instance will be displayed.