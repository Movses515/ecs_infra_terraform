module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "6.3.0"

  cluster_name = "my-ecs-cluster"

  services = {
    simple-ecs-service = {
      subnet_ids = module.vpc.private_subnets
      launch_type = "FARGATE"
      security_group_ids = [aws_security_group.ecs_security_group.id]
      desired_count = var.desired_count
      container_definitions = {
        cpu                = 256
      }
    }
  }

  tags = {
    Terraform = "TRUE"
    Environment = terraform.workspace
  }
}