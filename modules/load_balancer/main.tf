# Creating the ALB and its associated resources:
resource "aws_lb" "fargate_alb" {
  name               = "fargate-alb-009"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  enable_deletion_protection = true
  subnets            = var.subnets
  enable_cross_zone_load_balancing = true
}

resource "aws_lb_target_group" "fargate_tg" {
  name     = "fargate-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "fargate_listener_https" {
  load_balancer_arn = aws_lb.fargate_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08" # This is a commonly used SSL policy, adjust if needed
  certificate_arn   = var.cert_arn # Replace with your ACM certificate ARN

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fargate_tg.arn
  }
}
