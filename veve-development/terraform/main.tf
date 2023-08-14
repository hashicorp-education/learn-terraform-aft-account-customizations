module "terraform_cloud_oidc" {
  source  = "saidsef/terraform-cloud-oidc/aws"
  version = ">= 1.7.1"

  enabled              = true
  attach_admin_policy  = true
  create_oidc_provider = true
  organisation         = "veve-official"
  projects             = [{ "project" : "*", "workspaces" : ["*"], "run_phase" : "*" }]
  iam_role_name        = "terraform-cloud-oidc"
  max_session_duration = 3600
  url                  = "app.terraform.io"
  tags                 = local.tags
}

module "aws_oidc_github" {
  source  = "unfunco/oidc-github/aws"
  version = "1.5.2"

  enabled                 = true
  attach_admin_policy     = true
  attach_read_only_policy = false
  create_oidc_provider    = true
  iam_role_name           = "aws-oidc-github"
  enterprise_slug         = "ecomi"
  max_session_duration    = 3600
  github_repositories = [
    "veve-official/infrastructure-aft",
    "veve-official/infrastructure-elasticache"
  ]

  tags = local.tags
}
