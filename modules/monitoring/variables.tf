variable "topic_arn" {
    description     = "The topic ARN"
    type = list(string)
}

variable "load_balancer_arn" {
  description = "The ARN of the Load Balancer"
  type        = string
}
