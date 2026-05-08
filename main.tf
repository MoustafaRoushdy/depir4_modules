module "vpc" {
  source                  = "terraform-aws-modules/vpc/aws"
  version                 = "6.6.1"
  cidr                    = "10.1.0.0/16"
  azs                     = ["us-east-1a", "us-east-1b"]
  public_subnets          = ["10.1.0.0/24", "10.1.1.0/24"]
  map_public_ip_on_launch = true
}

module "my_module" {
  source       = "./modules/ec2"
  instance_ami = "ami-098e39bafa7e7303d"
  # instance_type = "t3.micro"
  subnet_id = module.vpc.public_subnets[0]
  create_sg = false
}

output "name" {
  value = module.my_module.instance_public_ip
}

provider "aws" {
  profile = "xyz"
}