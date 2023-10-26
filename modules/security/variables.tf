# variable "my_project_sg_name" {
#   description = "Name for the my-project security group"
#   type = string
# }

# variable "ecs_tasks_sg_name" {
#   description = "Name for the ECS tasks security group"
#   type = string
# }

# variable "cidr_blocks" {
#   description = "CIDR blocks for the security group ingress rules"
#   type        = list(string)
# }

variable "vpc_id" {
  description = "the vpc id"
  type = string
}
