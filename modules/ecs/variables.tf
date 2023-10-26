variable "container_image" {
  description = "The image used in the container"
  type        = string
}

variable "execution_role_arn" {}

variable "subnets" {}
variable "ecs_security_groups" {}