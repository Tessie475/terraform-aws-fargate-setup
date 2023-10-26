resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Effect = "Allow",
    }]
  })
}

resource "aws_iam_policy" "ecs_task_policy" {
  name        = "ECSTaskPolicy"
  description = "My policy that grants ECS tasks permission to interact with ECR"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   =  [
  "ecr:GetAuthorizationToken",
  "ecr:BatchCheckLayerAvailability",
  "ecr:GetDownloadUrlForLayer"
],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
