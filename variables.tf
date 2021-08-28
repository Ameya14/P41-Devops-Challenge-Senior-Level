variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_name" {
  type = string
  default = "p41-vpc"
}

variable "eks_cluster_name" {
  type = string
  default = "p41_eks_cluster"
}

variable "node_instance_type" {
  type = string
  default = "t3a.large"
}

variable "vpc_azs" {
  type = list
  default = ["us-east-1a", "us-east-1b"]
}

variable "vpc_cidr" {
  type = string
  default = "100.0.0.0/16"
}

variable "public_subnets" {
  type = list
  default = ["100.0.1.0/24", "100.0.2.0/24"]
}

variable "private_subnets" {
  type = list
  default = ["100.0.101.0/24", "100.0.102.0/24"]
}

