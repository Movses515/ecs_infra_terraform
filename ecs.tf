module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "6.3.0"

  cluster_name = "my-ecs-cluster"

  services = {
    simple-ecs-service = {
      subnet_ids         = module.vpc.private_subnets
      launch_type        = "FARGATE"
      security_group_ids = [aws_security_group.ecs_security_group.id]
      desired_count      = var.desired_count
      create_security_group = false
      container_definitions = {
        ecs-sample = {
          cpu       = 512
          memory    = 1024
          essential = true
          image     = "${var.container_image}:${var.image_version}"
          readonlyRootFilesystem = false
          portMappings = [
            {
              name          = "ecs-sample-port-mappings"
              containerPort = var.container_port
              protocol      = "tcp"
            }
          ]
        }
      }
      load_balancer = {
        service = {
          container_port = 80
          container_name = "ecs-sample"
          target_group_arn = aws_alb_target_group.ecs_target_group.arn
        }
      }
    }
  }

  tags = {
    Terraform   = "TRUE"
    Environment = terraform.workspace
  }
}