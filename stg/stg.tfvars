# Global Vars
env = "stg"
region = "eu-west-2"

#++++++++++++++++++++++#
# Control Toggles     #
#++++++++++++++++++++++#
#+++++#
# VPC #
#+++++#
create_ssh_keypair                    = true
create_vpc                            = true
create_database_subnet_group          = true
enable_dns_hostnames                  = true
enable_dns_support                    = true
enable_nat_gateway                    = true
single_nat_gateway                    = true
enable_flow_log                       = true
create_flow_log_cloudwatch_log_group  = true
create_flow_log_cloudwatch_iam_role   = true
enable_classiclink                    = false
enable_classiclink_dns_support        = false
enable_vpn_gateway                    = false
enable_dhcp_options                   = false
enable_s3_endpoint                    = false
enable_ec2_endpoint                   = false
ec2_endpoint_private_dns_enabled      = false


#++++++++++#
# VPC VARS #
#++++++++++#
cidr              = "10.20.0.0/21"
azs               = ["eu-west-2a", "eu-west-2b"]
public_subnets    = ["10.20.0.0/24", "10.20.1.0/24"]
private_subnets   = ["10.20.2.0/24", "10.20.3.0/24"]

#++++++++++#
# VPC Peering
#++++++++++#
create_vpc_peering_connection = true
accepter_aws_assume_role_arn  = "arn:aws:iam::170902677803:role/rachio-cross-account-management"
requester_aws_assume_role_arn = "arn:aws:iam::323553456149:role/rachio-cross-account-management"
accepter_region               = "eu-west-2"
accepter_subnet_tag_filters   = ["stg private a","stg private b", "Development Public Subnet 2A"]
accepter_vpc_id               = "vpc-cbb4aea9"

#+++++++++++#
# EKS SPECS #
#+++++++++++#
route53_private_hosted_domain_name = "stg.rachvpc.io"

aws_cross_account = "170902677803"
aws_iam_cross_account_role = "rachio-cross-account-elasticsearch-backups-stg"

create_eks = true
cluster_endpoint_private_access = true
cluster_endpoint_public_access = true
eks_cluster_version = "1.18"

map_roles = [
  {
    rolearn  = "arn:aws:iam::323553456149:role/role-rachio-platform-stg-full-access"
    username = "role-rachio-platform-stg-full-access"
    groups   = ["system:masters"]
  }
]

map_users = [
  {
    userarn = "arn:aws:iam::323553456149:user/coderise_harmeek"
    username = "coderise_harmeek"
    groups    = ["system:masters"]
  },
  {
    userarn = "arn:aws:iam::323553456149:user/coderise_bayley"
    username = "coderise_bayley"
    groups    = ["system:masters"]
  },
  {
    userarn = "arn:aws:iam::323553456149:user/coderise_sumit"
    username = "coderise_sumit"
    groups    = ["system:masters"]
  },
  {
    userarn = "arn:aws:iam::323553456149:user/github-actions-rachio-platform-stg-eks"
    username = "github-actions-rachio-platform-stg-eks"
    groups    = ["system:masters"]
  },
]



worker_group_asg_desired_capacity = 4
worker_group_asg_max_size         = 5
worker_group_asg_min_size         = 3
worker_group_instance_type        = "t3.large"
worker_group_root_volume_size     = 200
worker_group_root_volume_type     = "gp2"