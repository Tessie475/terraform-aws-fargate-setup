module "ecs" {
  source    = "./modules/ecs"
   container_image = var.container_image
   execution_role_arn = module.iam.ecs_execution_role_arn
    subnets = module.networking.subnet_ids
    ecs_security_groups = module.security.sg_ecs_tasks_id
}

module "iam" {
  source    = "./modules/iam"
}

module "load_balancer" {
  source    = "./modules/load_balancer"
  cert_arn   = var.cert_arn
  subnets = module.networking.subnet_ids
    vpc_id = module.networking.vpc_id
    security_groups = module.security.my_project_sg_id
}

module "monitoring" {
  source    = "./modules/monitoring"
   topic_arn   = var.topic_arn
   load_balancer_arn = module.load_balancer.fargate_alb_arn
  # security_groups = module.security.my_project_sg_id
   }



module "networking" {
  source    = "./modules/networking"
  #   cidr_block = var.vpc_cidr_block
  #   cidr_block        = var.subnet1_cidr_block
  # cidr_block        = var.subnet2_cidr_block
  #  cidr_block = var.cidr_block
}

module "security" {
  source    = "./modules/security"
  vpc_id = module.networking.vpc_id
}