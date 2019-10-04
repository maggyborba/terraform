#
# Provider Configuration
#

provider "aws" {
  region    = "${var.aws_region}"
  profile   = "${var.aws_profile}"   # Variable to search the profile in the shared credentials file (e.g. ~/.aws/credentials)
 
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjuction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}