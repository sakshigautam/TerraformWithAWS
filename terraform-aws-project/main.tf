terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
}

module "sg" {
  source            = "./modules/security_groups"
  vpc_id            = module.vpc.vpc_id
  allowed_ssh_cidr  = var.my_ip
  allowed_http_cidr = ["0.0.0.0/0"]
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnet_ids[0]
  sg_id         = module.sg.sg_id
}
