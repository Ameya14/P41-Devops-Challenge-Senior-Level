module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}


module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "17.4.0"
  cluster_name    = var.eks_cluster_name
  cluster_version = "1.17"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  workers_group_defaults = {
      instance_type    = var.node_instance_type
  }
  node_groups = {
    worker = {
      desired_capacity = 2
      min_capacity     = 2
      max_capacity     = 2
    }
  }
}