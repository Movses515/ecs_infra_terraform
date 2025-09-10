resource "aws_alb" "ecs_load_balancer" {
  name = "ecs-load-balancer"
  internal = false
  load_balancer_type = "application"
  subnets = module.vpc.public_subnets
  security_groups = [aws_security_group.alb_sg.id]
}

resource "aws_alb_target_group" "ecs_target_group" {
  name = "alb-ecs-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id
  target_type = "ip"

  health_check {
    path = "/"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_alb_listener" "http_listener" {
  load_balancer_arn = aws_alb.ecs_load_balancer.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.ecs_target_group.arn
  }
}