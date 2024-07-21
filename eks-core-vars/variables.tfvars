################################################################################
# Cluster
################################################################################

cluster_region = "eu-west-1"
cluster_name = "eks-core-36"
cluster_version = "1.30"
cluster_endpoint_public_access  = true
cluster_enabled_log_types  = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
iam_role_use_name_prefix = false
kms_key_aliases = ["eks-core-36"]
manage_aws_auth_configmap = true


eks_managed_node_groups = {
  managed = {
    iam_role_name              = "eks-core-36-managed"
    iam_role_use_name_prefix   = false
    use_custom_launch_template = false
    instance_types             = ["m5.large"]
    min_size                   = 1
    max_size                   = 2
    desired_size               = 1
    labels                     = {
      Which = "managed"
    }
  }
}

fargate_profiles = {
  fargate = {
    iam_role_name            = "eks-core-36-fargate"
    iam_role_use_name_prefix = false
    selectors = [
      {
        namespace = "default"
        labels    = {
          Which = "fargate"
        }
      }
    ]
  }
}


self_managed_node_groups = {
  self_managed = {
    name                         = "eks-core-36-self-managed"
    use_name_prefix              = false
    iam_role_name                = "eks-core-36-self-managed"
    iam_role_use_name_prefix     = false
    launch_template_name         = "self-managed-eks-core-36"
    launch_template_use_name_prefix = false
    instance_type                = "m5.large"
    min_size                     = 1
    max_size                     = 2
    desired_size                 = 1
    labels    = {
      Which = "fargate"
    }
  }
}

tags = {
    Blueprint  = "eks-core-36"
    GithubRepo = "github.com/aws-ia/terraform-aws-eks-blueprints"
    Environment = "dev"
}


################################################################################
# VPC
################################################################################

vpc_cidr = "10.6.0.0/16"

################################################################################
# Add-on
################################################################################

enable_aws_load_balancer_controller = true
enable_cluster_proportional_autoscaler = false
enable_karpenter = false
enable_kube_prometheus_stack = false
enable_metrics_server = false
enable_external_dns  = false
enable_cert_manager = false
# cert_manager_route53_hosted_zone_arns = false