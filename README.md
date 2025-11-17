**Terraform AWS VPC + EC2 + Security Group Deployment**

This repo contains a complete AWS infrastructure deployment using Terraform modules:

VPC

Subnets

Internet Gateway

Route table

Security Groups

EC2 instance

**Architecture**

**Project Structure**

modules/
 ├── vpc
 ├── security_groups
 └── ec2

**Requirements**

Terraform ≥ 1.0

AWS CLI configured

AWS IAM user with EC2 + VPC permissions

**Deploy Infrastructure**

terraform init
terraform plan
terraform apply -auto-approve

**Output Example**
ec2_public_ip = "54.23.XX.XX"

**Cleanup**
terraform destroy -auto-approve
