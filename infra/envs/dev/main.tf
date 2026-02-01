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