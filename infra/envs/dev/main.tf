module "networking" {
  source = "../../modules/networking"
  vpc_endpoints_sg_id = module.security.vpc_endpoints_sg_id

}

module "security" {
    source = "../../modules/security-groups"
    vpc_id = module.networking.vpc_id
    app_port = var.app_port
    vpc_cidr = module.networking.vpc_cidr_block
  

    
}

module "dynamodb" {
  source = "../../modules/dynamodb"

}

module "ecr" {
  source = "../../modules/ecr"
}

module "ecs" {
  source = "../../modules/ecs"
  dynamodb_table_arn = module.dynamodb.dynamodb_table_arn
  ecs_sg_id = [module.security.ecs_sg_id]
  private_subnet_ids = module.networking.private_subnet_ids
  ecs_target_group_arn = module.alb.blue_target_group_arn
  

}

module "alb" {
  source = "../../modules/alb"
  vpc_id = module.networking.vpc_id
  alb_sg_id = module.security.alb_sg_id
  public_subnet_ids = module.networking.public_subnet_ids
}


