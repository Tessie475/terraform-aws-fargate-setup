output "fargate_alb_arn" {
  description = "ARN of the Fargate Application Load Balancer"
  value       = aws_lb.fargate_alb.arn
}

