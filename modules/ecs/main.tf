module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "6.3.0"

  cluster_name = "my-ecs-cluster"
  count = var.desired_count

  services = {
    subnet_ids = var.private_subnets
  }

  tags = {
    Terraform = "TRUE"
    Environment = terraform.workspace
  }
}