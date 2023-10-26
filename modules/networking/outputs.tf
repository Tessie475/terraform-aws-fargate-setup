output "vpc_id" {
  value = aws_vpc.my_project_vpc.id
}

output "subnet_ids" {
  description = "List of subnet IDs for my_project"
  value       = [aws_subnet.my_project_subnet.id, aws_subnet.my_project_subnet_2.id]
}
