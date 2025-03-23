variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "tags" {
  description = "Tags to apply to vpc"
  type        = map(string)
  default     = {}
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "A list of availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}
