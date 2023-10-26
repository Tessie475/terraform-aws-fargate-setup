output "my_project_sg_id" {
  description = "The ID of the my-project security group"
  value       = [aws_security_group.my-project-sg.id]
}

output "sg_ecs_tasks_id" {
    value = [aws_security_group.sg_ecs_tasks.id]
}