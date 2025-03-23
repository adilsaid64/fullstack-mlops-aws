variable "node_group_name" {
  description = "Name of EKS node group"
  type        = string
}

variable "cluster_name" {
  description = "Name of EKS Cluster to attach node group to"
  type        = string
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "private_subnets" {
  description = "Private subsets"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to node group"
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "Labels to apply to node group"
  type        = map(string)
  default     = {}
}
