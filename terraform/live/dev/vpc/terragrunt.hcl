include {
  path = find_in_parent_folders("root.hcl")
}


terraform {
  source = "../../../modules/vpc"
}

inputs = {
  vpc_name        = "dev-mlops-vpc"
  cidr            = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["eu-west-2a", "eu-west-2b"]

  tags = {
    Environment = "dev"
    Project     = "mlops"
    Terraform   = "true"
  }
}
