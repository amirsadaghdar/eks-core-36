module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "1.16.3" #ensure to update this to the latest/desired version

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  eks_addons = {
    aws-ebs-csi-driver = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    aws-efs-csi-driver = {
      most_recent = true
    }
  }

  enable_aws_load_balancer_controller    = var.enable_aws_load_balancer_controller
  enable_cluster_proportional_autoscaler = var.enable_cluster_proportional_autoscaler
  enable_karpenter                       = var.enable_karpenter
  enable_kube_prometheus_stack           = var.enable_kube_prometheus_stack
  enable_metrics_server                  = var.enable_metrics_server
  enable_external_dns                    = var.enable_external_dns
  enable_cert_manager                    = var.enable_cert_manager
  # cert_manager_route53_hosted_zone_arns  = var.cert_manager_route53_hosted_zone_arns

  tags = local.tags

}

