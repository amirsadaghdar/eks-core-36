module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_name                   = local.name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  cluster_enabled_log_types      = var.cluster_enabled_log_types # Backwards compat

  iam_role_name            = "${local.name}-cluster-role" # Backwards compat
  iam_role_use_name_prefix = var.iam_role_use_name_prefix # Backwards compat

  kms_key_aliases = var.kms_key_aliases # Backwards compat

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  manage_aws_auth_configmap = var.manage_aws_auth_configmap
  aws_auth_roles = [
    {
      rolearn  = data.aws_caller_identity.current.arn
      username = "${local.name}-userid"
      groups   = ["system:masters"]
    },
  ]

  # eks_managed_node_groups = var.eks_managed_node_groups

  fargate_profiles = var.fargate_profiles

  self_managed_node_groups = var.self_managed_node_groups

  tags = local.tags
}
