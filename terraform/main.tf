provider "aws" {
  region = "ap-south-1"
}
module "aws_vpc" {
  source = "./modules"
  aws_vpc = "192.168.0.0/16"
  env = "dev"
}