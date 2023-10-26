resource "aws_ecs_cluster" "fargate_cluster" {
  name = "fargate-cluster"
}


resource "aws_ecs_task_definition" "fargate_task" {
  family                   = "fargate-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([{
    name  = "my-container"
    image = var.container_image
    portMappings = [{
      containerPort = 80
    }]
  }])
}


resource "aws_ecs_service" "fargate_service" {
  name            = "fargate-service"
  cluster         = aws_ecs_cluster.fargate_cluster.id
  task_definition = aws_ecs_task_definition.fargate_task.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets = var.subnets
    security_groups = var.ecs_security_groups
    assign_public_ip = true
  }

  desired_count = 2

  lifecycle {
    create_before_destroy = true
  }
}