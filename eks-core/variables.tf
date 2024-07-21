################################################################################
# Cluster
################################################################################

variable "cluster_region" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.30"
}

variable "cluster_endpoint_public_access" {
  description = "Whether the EKS cluster endpoint is publicly accessible."
  type        = bool
  default     = true
}

variable "cluster_enabled_log_types" {
  description = "The list of EKS log types to enable."
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

# variable "iam_role_name" {
#   description = "The name of the IAM role for the EKS cluster."
#   type        = string
# }

variable "iam_role_use_name_prefix" {
  description = "Whether the iam role uses prefix."
  type        = bool
  default     = false
}

variable "kms_key_aliases" {
  description = "The list of KMS key aliases for the EKS cluster."
  type        = list(string)
}

# variable "vpc_id" {
#   description = "The VPC ID where the EKS cluster is deployed."
#   type        = string
# }

# variable "subnet_ids" {
#   description = "The list of subnet IDs for the EKS cluster."
#   type        = list(string)
# }

variable "manage_aws_auth_configmap" {
  description = "Whether to manage the aws-auth configmap."
  type        = bool
  default     = true
}

# variable "aws_auth_roles" {
#   description = "The list of AWS IAM roles to add to the aws-auth configmap."
#   type        = list(object({
#     rolearn  = string
#     username = string
#     groups   = list(string)
#   }))
# }

variable "eks_managed_node_groups" {
  description = "Configuration for the EKS managed node groups."
  type = map(object({
    iam_role_name              = string
    iam_role_use_name_prefix   = bool
    use_custom_launch_template = bool
    instance_types             = list(string)
    min_size                   = number
    max_size                   = number
    desired_size               = number
    labels                     = map(string)
  }))
}

variable "fargate_profiles" {
  description = "Configuration for the Fargate profiles."
  type = map(object({
    iam_role_name            = string
    iam_role_use_name_prefix = bool
    selectors = list(object({
      namespace = string
      labels    = map(string)
    }))
  }))
}

variable "self_managed_node_groups" {
  description = "Configuration for the self-managed node groups."
  type = map(object({
    name                            = string
    use_name_prefix                 = bool
    iam_role_name                   = string
    iam_role_use_name_prefix        = bool
    launch_template_name            = string
    launch_template_use_name_prefix = bool
    instance_type                   = string
    min_size                        = number
    max_size                        = number
    desired_size                    = number
    labels                          = map(string)
  }))
}

variable "tags" {
  description = "A map of tags to assign to the EKS cluster and resources."
  type        = map(string)
}


################################################################################
# VPC
################################################################################

variable "vpc_cidr" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
}

################################################################################
# Add-on
################################################################################

variable "enable_aws_load_balancer_controller" {
  description = "Enable AWS Load Balancer Controller."
  type        = bool
  default     = true
}

variable "enable_cluster_proportional_autoscaler" {
  description = "Enable Cluster Proportional Autoscaler."
  type        = bool
  default     = true
}

variable "enable_karpenter" {
  description = "Enable Karpenter."
  type        = bool
  default     = true
}

variable "enable_kube_prometheus_stack" {
  description = "Enable Kube Prometheus Stack."
  type        = bool
  default     = true
}

variable "enable_metrics_server" {
  description = "Enable Metrics Server."
  type        = bool
  default     = true
}

variable "enable_external_dns" {
  description = "Enable External DNS."
  type        = bool
  default     = true
}

variable "enable_cert_manager" {
  description = "Enable Cert Manager."
  type        = bool
  default     = true
}

# variable "cert_manager_route53_hosted_zone_arns" {
#   description = "List of Route 53 hosted zone ARNs for cert-manager."
#   type        = list(string)
#   default     = []  # Adjust as needed
# }